import 'package:get/get.dart';
import 'package:test/src/data/models/auth_model.dart';
import 'package:test/src/data/repository/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  final _authUser = AuthModel().obs;
  get authUser => _authUser.value;

  login(Auth user) {
    authRepository.login(user).then((value) {
      _authUser.value = value;
    });
  }
}
