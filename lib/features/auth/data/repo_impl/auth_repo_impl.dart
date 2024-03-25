import 'package:getasan_app/features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:getasan_app/features/auth/domain/models/app_user.dart';
import 'package:getasan_app/features/auth/domain/repo/auth_repo.dart';
import 'package:getasan_app/features/common/constant/error/app_failure.dart';
import 'package:getasan_app/features/common/helper/repo_helper.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource _remoteDatasource;

  AuthRepoImpl(this._remoteDatasource);

  @override
  Future<(AppUser?, AppFailure?)> login(String email, String password) async {
    return await RepoHelper.callDatasource<AppUser>(() async {
      return await _remoteDatasource.login(email, password);
    });
  }
}
