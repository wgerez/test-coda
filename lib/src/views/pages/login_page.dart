import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test/src/domain/controllers/auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('login'.tr),
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: controller.passwordController,
              //obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              child: Text('login'.tr),
              onPressed: () {
                controller.login(
                  email: controller.emailController.text,
                  password: controller.passwordController.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
