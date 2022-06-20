import 'dart:convert';

import 'package:test/src/core/constants.dart';
import 'package:test/src/core/system_logger.dart';
import 'package:test/src/data/models/client_model.dart';

import 'package:http/http.dart' as http;

class ClientClient {
  final http.Client httpClient;

  ClientClient({required this.httpClient});

  Future<bool> update(ClientRequestModel client) async {
    final url = Uri.parse(Constants.updateClientUrl);
    final cli = client.toJson();
    try {
      final response = await httpClient.post(url, body: cli);
      final data = json.decode(response.body);
      if (response.statusCode == 200 && data['success']) {
        SystemLogger.verbose(this, 'Data: ${data.toString()}');
        return true;
      }
      SystemLogger.error(this,
          'Status Code: ${response.statusCode} - Succes: ${data['success']}');
      return false;
    } catch (e) {
      SystemLogger.error(this, e.toString());
      return false;
    }
  }

  Future<bool> create(NewClientRequestModel client) async {
    final url = Uri.parse(Constants.newClientUrl);
    final cli = client.toJson();
    try {
      final response = await httpClient.post(url, body: cli);
      final data = json.decode(response.body);
      if (response.statusCode == 200 && data['success']) {
        SystemLogger.verbose(this, 'Data: ${data.toString()}');
        return true;
      }
      SystemLogger.error(this,
          'Status Code: ${response.statusCode} - Succes: ${data['success']}');
      return false;
    } catch (e) {
      SystemLogger.error(this, e.toString());
      return false;
    }
  }

  Future<bool> remove(int id) async {
    final url = Uri.parse(Constants.removeClientUrl + '$id');
    try {
      final response = await httpClient.delete(url);
      final data = json.decode(response.body);
      if (response.statusCode == 200 && data['success']) {
        SystemLogger.verbose(this, 'Data: ${data.toString()}');
        return true;
      }
      SystemLogger.error(this,
          'Status Code: ${response.statusCode} - Succes: ${data['success']}');
      return false;
    } catch (e) {
      SystemLogger.error(this, e.toString());
      return false;
    }
  }

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
