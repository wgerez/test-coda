import 'package:get/route_manager.dart';
import 'package:test/src/core/bindings/login_bindings.dart';
import 'package:test/src/core/route/pages.dart';
import 'package:test/src/views/pages/login_page.dart';

List<GetPage> getPages = [
  GetPage(
    name: Pages.loginPage,
    page: () => const LoginPage(),
    binding: LoginBindings(),
  )
];
