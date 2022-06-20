import 'package:test/src/data/models/client_model.dart';

abstract class ClientRepository {
  Future<List<ClientModel>> getAll();
  Future<bool> update(ClientRequestModel client);
  Future<bool> create(NewClientRequestModel client);
  Future<bool> remove(int id);
}
