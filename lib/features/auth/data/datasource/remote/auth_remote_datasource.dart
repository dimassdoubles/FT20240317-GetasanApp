import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/data/datasource/remote/auth_firebase_datasource.dart';
import 'package:getasan_app/features/auth/domain/models/app_user.dart';

final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>(
  (ref) => AuthFirebaseDatasource(),
);

abstract class AuthRemoteDatasource {
  Future<AppUser> login(String email, String password);
  Future<void> logout();
}
