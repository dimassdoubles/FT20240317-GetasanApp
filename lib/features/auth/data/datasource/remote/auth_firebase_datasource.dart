import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:getasan_app/features/auth/domain/models/app_user.dart';
import 'package:getasan_app/features/common/constant/error/app_exception.dart';
import 'package:getasan_app/features/desa/domain/models/desa.dart';

final authRemoteDatasource =
    Provider<AuthRemoteDatasource>((ref) => AuthFirebaseDatasource());

class AuthFirebaseDatasource implements AuthRemoteDatasource {
  final _db = FirebaseFirestore.instance;

  @override
  Future<AppUser> login(String email, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final snapshot =
          await _db.collection('users').doc(credential.user!.uid).get();

      final userMap = snapshot.data() as Map<String, dynamic>;

      return AppUser(
        id: credential.user!.uid,
        name: userMap['name'],
        email: userMap['email'],
        profilePict: '',
        desa: Desa(
          id: userMap['villageId'],
          name: userMap['villageName'],
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AppAuthException('User tidak ditemukan');
      } else if (e.code == 'wrong-password') {
        throw AppAuthException('Password salah');
      } else if (e.code == 'invalid-credential') {
        throw AppAuthException('Email atau password yang anda masukan salah');
      } else {
        rethrow;
      }
    } catch (e) {
      throw AppException(e.toString());
    }
  }
}
