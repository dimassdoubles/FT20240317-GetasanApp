import 'package:getasan_app/features/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:getasan_app/features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:getasan_app/features/auth/domain/models/app_user.dart';
import 'package:getasan_app/features/auth/domain/repo/auth_repo.dart';
import 'package:getasan_app/features/common/constant/error/app_failure.dart';
import 'package:getasan_app/features/common/helper/repo_helper.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource _remoteDatasource;
  final AuthLocalDatasource _localDatasource;

  AuthRepoImpl(this._remoteDatasource, this._localDatasource);

  @override
  Future<(AppUser?, AppFailure?)> login(String email, String password) async {
    return await RepoHelper.callDatasource<AppUser>(() async {
      final user = await _remoteDatasource.login(email, password);
      await _localDatasource.login(user);
      return user;
    });
  }

  @override
  Future<(void, AppFailure?)> logout() async {
    return await RepoHelper.callDatasource<void>(
      () async {
        _localDatasource.logout();
        _remoteDatasource.logout();
      },
    );
  }

  @override
  Future<(AppUser?, AppFailure?)> isLogin() async {
    return await RepoHelper.callDatasource<AppUser?>(
      () async {
        return await _localDatasource.isLogin();
      },
    );
  }
}
