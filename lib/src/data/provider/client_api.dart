import 'dart:convert';

import 'package:test/src/core/constants.dart';
import 'package:test/src/data/models/client_model.dart';

import 'package:http/http.dart' as http;

class ClientClient {
  final http.Client httpClient;

  ClientClient({required this.httpClient});

  Future<List<ClientModel>> getAll() async {
    final url = Uri.parse(Constants.listClientsUrl);
    final response = await httpClient.post(url);
    final data = json.decode(response.body);
    if (data['success']) {
      final clients = data['response']['data']
          .map<ClientModel>((json) => ClientModel.fromJson(json))
          .toList();
      return clients;
    } else {
      return <ClientModel>[];
    }
  }
}
