import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:getasan_app/features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:getasan_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:getasan_app/features/auth/domain/models/app_user.dart';
import 'package:getasan_app/features/common/constant/error/app_failure.dart';

final authRepoProvider = Provider<AuthRepo>(
  (ref) => AuthRepoImpl(
    ref.watch(authRemoteDatasourceProvider),
    ref.watch(authLocalDatasourceProvider),
  ),
);

abstract class AuthRepo {
  Future<(AppUser?, AppFailure?)> login(String email, String password);
  Future<(AppUser?, AppFailure?)> isLogin();
  Future<(void, AppFailure?)> logout();
}
