import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test/src/data/provider/auth_api.dart';
import 'package:test/src/data/repository/auth_repository.dart';
import 'package:test/src/domain/controllers/login_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() {
      return AuthController(
        authRepository: AuthRepository(
          authClient: AuthClient(
            httpClient: http.Client(),
          ),
        ),
      );
    });
  }
}
