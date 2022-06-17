import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/src/domain/controllers/client_controller.dart';

class EditClientWidget extends GetWidget<ClientController> {
  const EditClientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
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
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 35),
            child: Text('Add new client'),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            color: Colors.yellow[50],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                              'assets/images/profiles/profile1_3x.png'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'FirstName',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'LastName',
                        ),
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
