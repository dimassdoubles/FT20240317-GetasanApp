import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/domain/repo/auth_repo.dart';
import 'package:getasan_app/features/common/constant/error/app_exception.dart';
import 'package:getasan_app/features/lapor_kelahiran/data/datasource/remote/laporan_kelahiran_remote_datasource.dart';
import 'package:getasan_app/features/lapor_kelahiran/domain/model/laporan_kelahiran.dart';

class FirebaseLaporanKelahiranDatasource
    implements LaporanKelahiranRemoteDatasource {
  final Ref _ref;

  FirebaseLaporanKelahiranDatasource(this._ref);

  @override
  Future<void> createLaporan({
    required String id,
    required String desaId,
    required String noKk,
    required String namaBayi,
    required String anakKe,
    required String jenisKelamin,
    required int jamKelahiran,
    required int menitKelahiran,
    required String tempatLahir,
    required DateTime tanggalLahir,
    required String namaAyah,
    required String pekerjaanAyah,
    required String alamatRumahAyah,
    required String nikAyah,
    required String noHpAyah,
    required String emailAyah,
    required String namaIbu,
    required String pekerjaanIbu,
    required String alamatRumahIbu,
    required String nikIbu,
    required String emailIbu,
  }) async {
    try {
      final authProvider = _ref.read(authRepoProvider);
      final (user, error) = await authProvider.isLogin();
      if (error != null) {
        throw AppAuthException("User belum login");
      }

      final desaId = user!.desa.id;

      final firestore = FirebaseFirestore.instance;
      CollectionReference laporanCollection = firestore.collection(
        'kelahiranReports',
      );

      final id = laporanCollection.doc().id;
      await laporanCollection.doc(id).set(
            LaporanKelahiran(
              id: id,
              desaId: desaId,
              noKk: noKk,
              namaBayi: namaBayi,
              anakKe: anakKe,
              jenisKelamin: jenisKelamin,
              jamKelahiran: jamKelahiran,
              menitKelahiran: menitKelahiran,
              tempatLahir: tempatLahir,
              tanggalLahir: tanggalLahir,
              namaAyah: namaAyah,
              pekerjaanAyah: pekerjaanAyah,
              alamatRumahAyah: alamatRumahAyah,
              nikAyah: nikAyah,
              noHpAyah: noHpAyah,
              emailAyah: emailAyah,
              namaIbu: namaIbu,
              pekerjaanIbu: pekerjaanIbu,
              alamatRumahIbu: alamatRumahIbu,
              nikIbu: nikIbu,
              emailIbu: emailIbu,
            ).toJson(),
          );
    } catch (e) {
      throw AppException("Gagal membuat laporan kelahiran: ${e.toString}");
    }
  }

  @override
  Future<List<LaporanKelahiran>> getLaporan(int year, int month) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final authProvider = _ref.read(authRepoProvider);
      final (user, error) = await authProvider.isLogin();
      if (error != null) {
        throw AppAuthException("User belum login");
      }

      final desaId = user!.desa.id;

      final startTime = DateTime(year, month, 1);
      final endTime =
          DateTime(year, month + 1, 1).subtract(const Duration(days: 1));

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection("kelahiranReports")
          .where("tanggalLahir",
              isGreaterThanOrEqualTo: startTime, isLessThan: endTime)
          .where("villageId", isEqualTo: desaId)
          .get();

      final List<LaporanKelahiran> daftarLaporan = [];
      for (var document in querySnapshot.docs) {
        debugPrint("Sampai sini guwa");
        debugPrint(document.data.toString());
        daftarLaporan.add(
          LaporanKelahiran.fromJson(document.data()),
        );
      }

      return daftarLaporan;
    } catch (e) {
      throw AppException("Gagal mendapatkan laporan kematian: ${e.toString()}");
    }
  }
}
