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
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: size.width * 0.6,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Text('login'.tr),
                  Obx(
                    () => TextFormField(
                      obscureText: controller.isEmailObscure.value,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () => controller.changeMailObscure(),
                          child: Icon(controller.isEmailObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        labelText: 'Mail',
                      ),
                      validator: controller.validateEmail,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => TextFormField(
                      controller: controller.passwordController,
                      obscureText: controller.isPassObscure.value,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () => controller.changePassObscure(),
                          child: Icon(controller.isPassObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        labelText: 'Password',
                      ),
                      validator: controller.validatePassword,
                    ),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    child: MinimalButton(
                      text: 'login'.tr,
                      action: controller.callLogin,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
