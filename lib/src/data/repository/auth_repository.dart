import 'package:dartz/dartz.dart';
import 'package:test/src/data/models/auth_model.dart';
import 'package:test/src/data/models/login_failure_model.dart';

abstract class AuthRepository {
  Future<Either<LoginFailure, AuthModel>> login(Auth user);
}
