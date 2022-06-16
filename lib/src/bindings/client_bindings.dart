import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test/src/data/provider/client_api.dart';
import 'package:test/src/data/repository/client_repository_impl.dart';
import 'package:test/src/domain/controllers/client_controller.dart';

class ClientBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientController>(() {
      return ClientController(
        clientRepository: ClientRepositoryImpl(
          clientClient: ClientClient(
            httpClient: http.Client(),
          ),
        ),
      );
    });
  }
}
