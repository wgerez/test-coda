import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:test/src/domain/controllers/auth_controller.dart';
import 'package:test/src/data/provider/auth_api.dart';
import 'package:test/src/domain/controllers/client_controller.dart';
import 'package:test/src/views/widgets/item_client.dart';
import 'package:test/src/views/widgets/new_client_widget.dart';
import 'package:test/src/views/widgets/widgets.dart';
import 'package:test/src/data/repository/auth_repository_impl.dart';

class ClientsPage extends GetView<ClientController> {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put<AuthController>(AuthController(
        authRepository: AuthRepositoryImpl(
            authClient: AuthClient(httpClient: http.Client()))));
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
          const Positioned(
            top: 100,
            right: -80,
            child: YellowCircle(
              colorCircle: Color.fromARGB(255, 228, 243, 83),
              sizeCircle: 0.6,
            ),
          ),
          const Positioned(
            bottom: -100,
            right: -80,
            child: YellowCircle(
              colorCircle: Color.fromARGB(255, 251, 255, 217),
              sizeCircle: 0.6,
            ),
          ),
          const Positioned(
            bottom: -100,
            left: -80,
            child: YellowCircle(
              colorCircle: Color.fromARGB(255, 250, 255, 201),
              sizeCircle: 0.6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    elevation: 0,
                    mini: true,
                    onPressed: () async {
                      await Get.defaultDialog(
                        title: '',
                        titlePadding: const EdgeInsets.all(0),
                        contentPadding: const EdgeInsets.only(bottom: 5),
                        content: Text('leave_text'.tr),
                        confirm: SizedBox(
                          width: 150,
                          child: MinimalButton(
                            text: 'leave'.tr,
                            action: () {
                              authController.logout();
                            },
                            padding: 10,
                          ),
                        ),
                        cancel: TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            'cancel'.tr,
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ),
                      );
                    },
                    backgroundColor: Colors.black,
                    child: const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: size.width * 0.35,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('clients'.tr),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextField(
                        onChanged: controller.searchClient,
                        decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'search'.tr,
                          contentPadding: const EdgeInsets.all(0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: MinimalButton(
                      text: 'add_new'.tr,
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
                              text: 'save'.tr,
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
                              'cancel'.tr,
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
                    () => controller.loading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : RefreshIndicator(
                            onRefresh: controller.getAll,
                            child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: controller.listClients.length,
                              itemBuilder: (context, int index) {
                                return ItemClient(
                                    client: controller.listClients[index]);
                              },
                            ),
                          ),
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
