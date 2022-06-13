import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test/src/core/route/route.dart';
import 'package:test/src/core/translations.dart';
import 'package:test/src/views/pages/pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      home: const LoginPage(),
      locale: Get.deviceLocale,
      title: 'Test Coda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      translations: Messages(),
    );
  }
}
