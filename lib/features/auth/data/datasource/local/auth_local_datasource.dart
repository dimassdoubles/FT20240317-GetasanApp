import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/data/datasource/local/auth_hive_datasource.dart';
import 'package:getasan_app/features/auth/domain/models/app_user.dart';

final authLocalDatasourceProvider = Provider<AuthLocalDatasource>(
  (ref) => AuthHiveDatasource(),
);

abstract class AuthLocalDatasource {
  Future<void> login(AppUser user);

  Future<AppUser?> isLogin();

  Future<void> logout();
}
