import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:test/src/core/constants.dart';
import 'package:test/src/core/system_logger.dart';

import 'package:test/src/data/models/auth_model.dart';
import 'package:test/src/data/models/login_failure_model.dart';

class AuthClient {
  final http.Client httpClient;

  AuthClient({required this.httpClient});

  Future<Either<LoginFailure, AuthModel>> login({required Auth user}) async {
    final Map<String, String> data = {
      'email': user.email,
      'password': user.password,
    };
    var _failure = LoginFailure(
      code: -999,
      message: 'Something went wrong',
    );
    try {
      final url = Uri.parse(Constants.authUrl);
      final response = await httpClient.post(url, body: data);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success']) {
          final auth = AuthModel.fromJson(data);
          return Right(auth);
        } else {
          _failure = LoginFailure(
            code: data['error']['code'],
            message: data['error']['message'],
          );
          return Left(_failure);
        }
      } else {
        return Left(_failure);
      }
    } catch (e) {
      SystemLogger.error(this, e.toString());
      return Left(_failure);
    }
  }
}
