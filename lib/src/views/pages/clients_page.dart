import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test/src/domain/controllers/client_controller.dart';
import 'package:test/src/views/widgets/item_client.dart';
import 'package:test/src/views/widgets/new_client_widget.dart';
import 'package:test/src/views/widgets/widgets.dart';

class ClientsPage extends GetView<ClientController> {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned(
            top: -230,
            left: -100,
            child: YellowCircle(
              colorCircle: Color.fromARGB(255, 228, 243, 83),
              sizeCircle: 0.6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: size.width * 0.35,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text('CLIENTS'),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onChanged: (value) {
                          // do something
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: MinimalButton(
                      text: 'ADD NEW',
                      action: () async {
                        await Get.defaultDialog(
                          barrierDismissible: false,
                          title: '',
                          titlePadding: const EdgeInsets.all(0),
                          contentPadding: const EdgeInsets.only(bottom: 5),
                          content: const NewClientWidget(),
                          confirm: SizedBox(
                            width: 150,
                            child: MinimalButton(
                              text: 'SAVE',
                              action: () async {
                                if (await controller.newClient()) {
                                  await controller.getAll();
                                  Get.back();
                                }
                              },
                              padding: 10,
                            ),
                          ),
                          cancel: TextButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          ),
                        );
                      },
                      padding: 10,
                    ))
                  ],
                ),
                Expanded(
                  child: Obx(
                    () => ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ...controller.listClients
                            .map((cli) => ItemClient(client: cli))
                            .toList(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: MinimalButton(
                    text: 'LOAD MORE',
                    action: () {},
                    padding: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
