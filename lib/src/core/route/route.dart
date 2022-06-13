import 'package:get/route_manager.dart';
import 'package:test/src/core/bindings/login_bindings.dart';
import 'package:test/src/views/pages/login_page.dart';
part './pages.dart';

List<GetPage> getPages = [
  GetPage(
    name: Routes.loginPage,
    page: () => const LoginPage(),
    binding: LoginBindings(),
  )
];
