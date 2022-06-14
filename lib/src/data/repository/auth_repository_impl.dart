import 'package:test/src/data/models/auth_model.dart';
import 'package:test/src/data/provider/auth_api.dart';
import 'package:test/src/data/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthClient authClient;

  AuthRepositoryImpl({required this.authClient});

  @override
  login(Auth user) {
    return authClient.login(user: user);
  }
}
