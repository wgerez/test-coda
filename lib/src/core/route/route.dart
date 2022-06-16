import 'package:get/route_manager.dart';

import 'package:test/src/bindings/auth_bindings.dart';
import 'package:test/src/bindings/client_bindings.dart';
import 'package:test/src/views/pages/pages.dart';

part './pages.dart';

List<GetPage> getPages = [
  GetPage(
    name: Routes.loginPage,
    page: () => const LoginPage(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: Routes.listClients,
    page: () => const ClientsPage(),
    binding: ClientBindings(),
  )
];
