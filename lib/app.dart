import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test/src/core/route/route.dart';
import 'package:test/src/core/translations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      initialRoute: Routes.loginPage,
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      title: 'Test Coda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'DMSans',
      ),
      translations: Messages(),
    );
  }
}
