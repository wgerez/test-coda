import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:test/src/core/system_logger.dart';
import 'package:test/src/data/models/client_model.dart';
import 'package:test/src/views/widgets/new_client_widget.dart';

class ItemClient extends StatelessWidget {
  const ItemClient({
    Key? key,
    required this.client,
  }) : super(key: key);
  final ClientModel client;

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
                Text(
                  '${client.firstname} ${client.lastname}',
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  client.email!,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Spacer(),
            SpeedDial(
              icon: Icons.more_vert,
              activeIcon: Icons.close,
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.black,
              overlayOpacity: 0.3,
              overlayColor: Colors.black,
              children: [
                SpeedDialChild(
                    child: const Icon(Icons.delete),
                    onTap: () =>
                        SystemLogger.verbose(this, 'Delete client...')),
                SpeedDialChild(
                    child: const Icon(Icons.edit),
                    onTap: () =>
                        Get.defaultDialog(content: const EditClientWidget())),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
