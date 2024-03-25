import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:getasan_app/features/auth/domain/models/app_user.dart';
import 'package:getasan_app/features/common/constant/error/app_exception.dart';
import 'package:getasan_app/features/desa/domain/models/desa.dart';

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

      // TODO hapus ganti data sesuai dengan database
      return AppUser(
        name: 'Dimas Saputro',
        email: credential.user?.email ?? '',
        profilePict: '',
        desa: Desa(
          id: '1',
          name: 'Desa Sumber Jatipohon',
          image: '',
        ),
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
