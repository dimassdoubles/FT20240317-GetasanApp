import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/domain/repo/auth_repo.dart';
import 'package:getasan_app/features/common/helper/state_dialog_helper.dart';

final authControllerProvider = Provider(
  (ref) => AuthController(ref.watch(authRepoProvider)),
);

class AuthController {
  final AuthRepo _repo;

  AuthController(this._repo);

  Future<bool> login(String email, String password) async {
    StateDialogHelper.showLoading();
    final (_, err) = await _repo.login(email, password);
    StateDialogHelper.dismiss();

    if (err != null) {
      StateDialogHelper.showError('', err.message);
      return false;
    }
    return true;
  }
}
