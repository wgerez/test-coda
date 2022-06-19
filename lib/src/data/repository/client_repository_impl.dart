import 'package:test/src/data/models/client_model.dart';
import 'package:test/src/data/provider/client_api.dart';
import 'package:test/src/data/repository/client_repository.dart';

class ClientRepositoryImpl implements ClientRepository {
  final ClientClient clientClient;

  ClientRepositoryImpl({required this.clientClient});

  @override
  Future<List<ClientModel>> getAll() {
    return clientClient.getAll();
  }

  @override
  Future<bool> update(ClientRequestModel client) {
    return clientClient.update(client);
  }
}
