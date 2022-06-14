import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:test/src/data/provider/auth_api.dart';
import 'package:test/src/data/repository/auth_repository_impl.dart';
import 'package:test/src/domain/controllers/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() {
      return AuthController(
        authRepository: AuthRepositoryImpl(
          authClient: AuthClient(
            httpClient: http.Client(),
          ),
        ),
      );
    });
  }
}
