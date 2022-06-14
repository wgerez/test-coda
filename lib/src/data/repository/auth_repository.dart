import 'package:test/src/data/models/auth_model.dart';
import 'package:test/src/data/provider/auth_api.dart';

class AuthRepository {
  final AuthClient authClient;

  AuthRepository({required this.authClient});

  login(Auth user) {
    return authClient.login(user: user);
  }
}
