import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test/src/domain/controllers/auth_controller.dart';
import 'package:test/src/views/widgets/widgets.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(children: [
          const Positioned(
            top: -280,
            right: -130,
            child: YellowCircle(
              colorCircle: Color.fromARGB(255, 228, 243, 83),
              sizeCircle: 0.9,
            ),
          ),
          const Positioned(
            top: 130,
            left: -130,
            child: YellowCircle(
              colorCircle: Color.fromARGB(71, 227, 243, 83),
              sizeCircle: 0.5,
            ),
          ),
          const Positioned(
            bottom: -380,
            right: 50,
            child: YellowCircle(
              colorCircle: Color.fromARGB(71, 227, 243, 83),
              sizeCircle: 0.9,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: size.width * 0.6,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Text('login'.tr),
                TextFormField(
                  obscureText: true,
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye),
                    labelText: 'Mail',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 35),
                SizedBox(
                  width: double.infinity,
                  child: MinimalButton(
                    text: 'login'.tr,
                    action: _callLogin(),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  _callLogin() {
    return () {
      controller.login(
        email: controller.emailController.text,
        password: controller.passwordController.text,
      );
    };
  }
}
