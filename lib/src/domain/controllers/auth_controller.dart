import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test/src/data/models/auth_model.dart';
import 'package:test/src/data/repository/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _authUser = AuthModel().obs;
  get authUser => _authUser.value;

  login({required String email, required String password}) async {
    Auth user = Auth(email: email, password: password);
    authRepository.login(user).then((value) {
      _authUser.value = value;
    });
  }
}
