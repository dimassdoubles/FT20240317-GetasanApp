import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/domain/models/app_user.dart';
import 'package:getasan_app/features/auth/domain/repo/auth_repo.dart';
import 'package:getasan_app/features/common/helper/state_dialog_helper.dart';

final authControllerProvider = Provider(
  (ref) => AuthController(ref, ref.watch(authRepoProvider)),
);

class AuthController {
  final AuthRepo _repo;
  final Ref _ref;

  AuthController(this._ref, this._repo);

  final currentUserProvider = StateProvider<AppUser?>((ref) => null);

  Future<bool> login(String email, String password) async {
    StateDialogHelper.showLoading();
    final (user, err) = await _repo.login(email, password);
    StateDialogHelper.dismiss();

    if (err != null) {
      StateDialogHelper.showError('', err.message);
      return false;
    }

    _ref.read(currentUserProvider.notifier).state = user;
    return true;
  }

  void logout() async {
    StateDialogHelper.showLoading();
    await Future.delayed(const Duration(seconds: 2));
    StateDialogHelper.dismiss();

    _ref.read(currentUserProvider.notifier).state = null;
  }
}
