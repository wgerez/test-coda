import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:test/app.dart';
import 'package:test/src/core/system_logger.dart';

void main() async {
  SystemLogger.init();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}
