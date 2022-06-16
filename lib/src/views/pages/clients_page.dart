import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/src/domain/controllers/client_controller.dart';
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
                              firstName:
                                  controller.listClients[item].firstname!,
                              lastName: controller.listClients[item].lastname!,
                              email: controller.listClients[item].email!,
                            )),
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

class ItemClient extends StatelessWidget {
  const ItemClient({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.email,
  }) : super(key: key);
  final String firstName;
  final String lastName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.0),
        side: const BorderSide(
          width: 1,
          color: Colors.black,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/profiles/profile1.png'),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$firstName $lastName'),
                Text(email),
              ],
            ),
            const Spacer(),
            const Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}
