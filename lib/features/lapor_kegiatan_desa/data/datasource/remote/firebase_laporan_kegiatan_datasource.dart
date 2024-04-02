import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/domain/repo/auth_repo.dart';
import 'package:getasan_app/features/common/constant/error/app_exception.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/data/datasource/remote/laporan_kegiatan_remote_datasource.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/domain/model/laporan_kegiatan_desa.dart';

class FirebaseLaporanKegiatanDatasource
    implements LaporanKegiatanRemoteDatasource {
  final Ref _ref;

  FirebaseLaporanKegiatanDatasource(this._ref);

  @override
  Future<void> createLaporan({
    required String namaKegiatan,
    required String penanggungJawab,
    required DateTime tanggalKegiatan,
    required String hasilKegiatan,
    required String kendala,
    File? image,
  }) async {
    try {
      final authProvider = _ref.read(authRepoProvider);
      final (user, error) = await authProvider.isLogin();
      if (error != null) {
        throw AppAuthException("User belum login");
      }

      final desaId = user!.desa.id;
      String imageUrl = "";
      if (image != null) {
        try {
          final storage = FirebaseStorage.instance;
          String fileName = "kegiatan_${DateTime.now().microsecondsSinceEpoch}";

          Reference dirUpload = storage.ref().child('uploads/$fileName');

          await dirUpload.putFile(image);
          imageUrl = await dirUpload.getDownloadURL();
        } catch (e) {
          rethrow;
        }
      }

      final firestore = FirebaseFirestore.instance;
      CollectionReference laporanCollection = firestore.collection(
        "kegiatanReports",
      );

      final id = laporanCollection.doc().id;

      await laporanCollection.doc(id).set(
            LaporanKegiatanDesa(
              id: id,
              desaId: desaId,
              namaKegiatan: namaKegiatan,
              penanggungJawabKegiatan: penanggungJawab,
              hasilKegiatan: hasilKegiatan,
              kendala: kendala,
              date: tanggalKegiatan,
              imageUrl: imageUrl,
            ).toJson(),
          );
    } catch (e) {
      throw AppException("Gagal membuat laporan kegiatan: ${e.toString()}");
    }
  }

  @override
  Future<List<LaporanKegiatanDesa>> getLaporan(int year, int month) async {
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
          .collection("kegiatanReports")
          .where("date", isGreaterThanOrEqualTo: startTime, isLessThan: endTime)
          .where("villageId", isEqualTo: desaId)
          .get();

      final List<LaporanKegiatanDesa> daftarLaporan = [];
      for (var document in querySnapshot.docs) {
        daftarLaporan.add(LaporanKegiatanDesa.fromJson(document.data()));
      }

      return daftarLaporan;
    } catch (e) {
      throw AppException("Gagal mendapatkan laporan camat: ${e.toString()}");
    }
  }
}
