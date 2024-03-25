import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:getasan_app/features/auth/domain/models/app_user.dart';
import 'package:getasan_app/features/common/constant/error/app_exception.dart';

final authRemoteDatasource =
    Provider<AuthRemoteDatasource>((ref) => AuthFirebaseDatasource());

class AuthFirebaseDatasource implements AuthRemoteDatasource {
  @override
  Future<AppUser> login(String email, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return AppUser(
        name: 'User Getasan',
        profilePict: '',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AppAuthException('User tidak ditemukan');
      } else if (e.code == 'wrong-password') {
        throw AppAuthException('Password salah');
      } else {
        rethrow;
      }
    } catch (e) {
      throw AppException(e.toString());
    }
  }
}
