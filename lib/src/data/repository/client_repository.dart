import 'package:test/src/data/models/client_model.dart';

abstract class ClientRepository {
  Future<List<ClientModel>> getAll();
}
