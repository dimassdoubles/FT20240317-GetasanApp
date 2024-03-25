import 'package:flutter/material.dart';
import 'package:getasan_app/features/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:getasan_app/features/auth/domain/models/app_user.dart';
import 'package:getasan_app/features/common/constant/error/app_exception.dart';
import 'package:getasan_app/features/desa/domain/models/desa.dart';
import 'package:hive/hive.dart';

class AuthHiveDatasource implements AuthLocalDatasource {
  static const boxName = 'auth';
  @override
  Future<void> login(AppUser user) async {
    try {
      final box = await Hive.openBox(boxName);
      box.put('id', user.id);
      box.put('name', user.name);
      box.put('email', user.email);
      box.put('villageId', user.desa.id);
      box.put('villageName', user.desa.name);
      box.put('profilePict', user.profilePict);
    } catch (e) {
      throw AppAuthException(
        'Gagal menyimpan data user ke lokal: ${e.toString()}',
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      final box = await Hive.openBox(boxName);
      box.delete('id');
      box.delete('name');
      box.delete('email');
      box.delete('villageId');
      box.delete('villageName');
      box.delete('profilePict');
    } catch (e) {
      throw AppAuthException(
        'Gagal menghapus data user di lokal: ${e.toString()}',
      );
    }
  }

  @override
  Future<AppUser?> isLogin() async {
    try {
      final box = await Hive.openBox(boxName);

      final id = box.get('id');

      debugPrint('user sudah login, id: $id');
      if (id == null) {
        debugPrint('user belum login');
        return null;
      }

      String name = box.get('name');
      String email = box.get('email');
      String profilePict = box.get('profilePict');
      String villageId = box.get('villageId');
      String villageName = box.get('villageName');

      return AppUser(
        id: id,
        name: name,
        profilePict: profilePict,
        desa: Desa(id: villageId, name: villageName),
        email: email,
      );
    } catch (e) {
      throw AppAuthException(
        'Gagal membaca data user login di lokal: ${e.toString()}',
      );
    }
  }
}
