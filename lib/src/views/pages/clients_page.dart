import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/src/domain/controllers/client_controller.dart';

class ClientsPage extends GetView<ClientController> {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.listClients.length,
            itemBuilder: (context, item) => ListTile(
              title: Text(controller.listClients[item].firstname ?? ''),
            ),
          ),
        ),
      ),
    );
  }
}
