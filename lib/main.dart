import 'package:flutter/material.dart';

import 'package:test/app.dart';
import 'package:test/src/core/system_logger.dart';

void main() {
  SystemLogger.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
