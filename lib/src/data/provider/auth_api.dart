import 'package:http/http.dart' as http;
import 'package:test/src/core/constants.dart';
import 'package:test/src/core/system_logger.dart';

import 'package:test/src/data/models/auth_model.dart';

class AuthClient {
  final http.Client httpClient;

  AuthClient({required this.httpClient});

  login({required Auth user}) async {
    final Map data = {
      'email': user.email,
      'password': user.password,
    };
    try {
      final url = Uri.parse(Constants.authUrl);
      final response = await httpClient.post(url, body: data);
      if (response.statusCode == 200) {
        SystemLogger.verbose(this, response.body);
        return response.body;
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      SystemLogger.verbose(this, e.toString());
    }
  }
}
