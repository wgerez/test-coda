import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test/src/domain/controllers/client_controller.dart';
import 'package:test/src/views/widgets/item_client.dart';
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
                      action: () {},
                      padding: 10,
                    ))
                  ],
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.listClients.length,
                      itemBuilder: (context, item) => ItemClient(
                        client: controller.listClients[item],
                      ),
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
