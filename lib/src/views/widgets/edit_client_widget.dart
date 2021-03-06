import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/src/domain/controllers/client_controller.dart';

class EditClientWidget extends GetView<ClientController> {
  const EditClientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.99,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 35),
            child: Text('Edit client'),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            color: Colors.yellow[50],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Form(
                key: controller.formUpdateKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/profiles/profile1_3x.png',
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: controller.firstNameController,
                        decoration: const InputDecoration(
                          hintText: 'First name*',
                        ),
                        validator: controller.validateFirstName,
                      ),
                      TextFormField(
                        controller: controller.lastNameController,
                        decoration: const InputDecoration(
                          hintText: 'Last name*',
                        ),
                        validator: controller.validateLastName,
                      ),
                      TextFormField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email address*',
                        ),
                        validator: controller.validateEmail,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
