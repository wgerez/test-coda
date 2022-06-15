import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/src/core/system_logger.dart';
import 'package:test/src/data/models/auth_model.dart';
import 'package:test/src/data/repository/auth_repository_impl.dart';

class AuthController extends GetxController {
  final AuthRepositoryImpl authRepository;

  AuthController({required this.authRepository});

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final isEmailObscure = false.obs;
  final isPassObscure = false.obs;

  final _authUser = AuthModel().obs;
  get authUser => _authUser.value;

  String? validateEmail(String? mail) {
    if (mail != null && !GetUtils.isEmail(mail)) {
      return 'Mail is required';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password != null && password.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  void changeMailObscure() {
    isEmailObscure.value = !isEmailObscure.value;
  }

  void changePassObscure() {
    isPassObscure.value = !isPassObscure.value;
  }

  login({required String email, required String password}) async {
    final user = Auth(email: email, password: password);
    final _auth = await authRepository.login(user);
    _auth.fold(
      (l) => Get.defaultDialog(
        title: 'Error'.tr,
        content: Text(l.message),
        actions: [
          ElevatedButton(
            child: Text('Ok'.tr),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      (r) => SystemLogger.verbose(this, r.toString()), //_authUser.value = r,
    );
  }

  callLogin() {
    if (formKey.currentState!.validate()) {
      login(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }
}
