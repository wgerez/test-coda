import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class SystemLogger {
  static late final Logger _logger;
  static final DateFormat _dateFormat = DateFormat.Hms();

  static void init() {
    const enableLogs =
        String.fromEnvironment('enable_logs', defaultValue: 'true');
    const enabled = enableLogs == 'true';

    _logger = Logger(
      filter: _Filter(enabled),
      printer: PrettyPrinter(
        methodCount: 0,
        printEmojis: false,
      ),
    );
  }

  static void verbose(Object target, String message) =>
      _logger.v(_getLogString(target, message));

  static void error(Object target, String message) =>
      _logger.e(_getLogString(target, message));

  static _getLogString(Object target, String message) {
    final parsedTarget = (target is String) ? target : '${target.runtimeType}';
    final now = DateTime.now();
    return '$parsedTarget - ${_dateFormat.format(now)}\n\n$message';
  }
}

class _Filter extends DevelopmentFilter {
  final bool enabled;

  _Filter(this.enabled);

  @override
  bool shouldLog(LogEvent event) {
    if (!enabled) {
      return false;
    }

    return super.shouldLog(event);
  }
}
