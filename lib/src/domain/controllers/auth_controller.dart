import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test/src/core/system_logger.dart';
import 'package:test/src/data/models/auth_model.dart';
import 'package:test/src/data/repository/auth_repository_impl.dart';

class AuthController extends GetxController {
  final AuthRepositoryImpl authRepository;

  AuthController({required this.authRepository});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _authUser = AuthModel().obs;
  get authUser => _authUser.value;

  login({required String email, required String password}) async {
    Auth user = Auth(email: email, password: password);
    final _auth = await authRepository.login(user);
    _auth.fold(
      (l) => SystemLogger.error(this, l.toString()),
      (r) => SystemLogger.verbose(this, r.toString()), //_authUser.value = r,
    );
  }
}
