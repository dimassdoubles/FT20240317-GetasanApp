import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/domain/repo/auth_repo.dart';
import 'package:getasan_app/features/common/constant/error/app_exception.dart';
import 'package:getasan_app/features/lapor_kemiskinan/data/datasource/remote/lapor_kemiskinan_remote_datasource.dart';
import 'package:getasan_app/features/lapor_kemiskinan/domain/models/laporan_kemiskinan.dart';

class LaporKemiskinanFirebaseDatasource
    implements LaporKemiskinanRemoteDatasource {
  final Ref _ref;

  LaporKemiskinanFirebaseDatasource(this._ref);

  @override
  Future<void> createLaporan({
    required String noKk,
    required String namaKepalaKeluarga,
    required String pekerjaan,
    required String alamat,
    required String titikKoordinat,
    File? gambarDepan,
    File? gambarBelakang,
  }) async {
    try {
      final authProvider = _ref.read(authRepoProvider);
      final (user, error) = await authProvider.isLogin();
      if (error != null) {
        throw AppAuthException("User belum login");
      }

      final desaId = user!.desa.id;

      late String gambarDepanUrl;
      gambarDepanUrl = await _uploadGambar(gambarDepan);

      late String gambarBelakangUrl;
      gambarBelakangUrl = await _uploadGambar(gambarBelakang);

      final firestore = FirebaseFirestore.instance;
      CollectionReference laporanCollection = firestore.collection(
        'kemiskinanReports',
      );

      final id = laporanCollection.doc().id;

      await laporanCollection.doc(id).set(
            LaporanKemiskinan(
              id: id,
              desaId: desaId,
              date: DateTime.now(),
              alamat: alamat,
              gambarBelakangUrl: gambarBelakangUrl,
              gambarDepanUrl: gambarDepanUrl,
              namaKepalaKeluarga: namaKepalaKeluarga,
              noKk: noKk,
              pekerjaan: pekerjaan,
              titikKoordinat: titikKoordinat,
            ).toJson(),
          );
    } catch (e) {
      throw AppException(
        'Gagal membuat laporan kemiskinan: ${e.toString()}',
      );
    }
  }

  Future<String> _uploadGambar(File? image) async {
    if (image != null) {
      final storage = FirebaseStorage.instance;
      String fileName =
          'kemiskinan_${DateTime.now().millisecondsSinceEpoch.toString()}';
      Reference dirUpload = storage.ref().child('uploads/$fileName');

      await dirUpload.putFile(image);
      return await dirUpload.getDownloadURL();
    }
    return "";
  }

  @override
  Future<List<LaporanKemiskinan>> getLaporan(int tahun, int bulan) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final authProvider = _ref.read(authRepoProvider);
      final (user, error) = await authProvider.isLogin();
      if (error != null) {
        throw AppAuthException("User belum login");
      }

      final desaId = user!.desa.id;

      final startTime = DateTime(tahun, bulan, 1);
      final endTime =
          DateTime(tahun, bulan + 1, 1).subtract(const Duration(days: 1));

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection("kemiskinanReports")
          .where("date", isGreaterThanOrEqualTo: startTime, isLessThan: endTime)
          .where("villageId", isEqualTo: desaId)
          .get();

      final List<LaporanKemiskinan> daftarLaporan = [];
      for (var document in querySnapshot.docs) {
        daftarLaporan.add(
          LaporanKemiskinan.fromJson(
            document.data(),
          ),
        );
      }

      return daftarLaporan;
    } catch (e) {
      throw AppException(
        "Gagal mendapatkan laporan kemiskinan: ${e.toString()}",
      );
    }
  }
}
