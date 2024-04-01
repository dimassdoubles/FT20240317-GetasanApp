import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/domain/repo/auth_repo.dart';
import 'package:getasan_app/features/common/constant/error/app_exception.dart';
import 'package:getasan_app/features/lapor_camat/data/datasource/remote/lapor_camat_remote_datasource.dart';
import 'package:getasan_app/features/lapor_camat/domain/models/laporan_camat.dart';

class LaporCamatFirebaseDatasource implements LaporCamatRemoteDatasource {
  final Ref _ref;

  LaporCamatFirebaseDatasource(this._ref);

  @override
  Future<void> createLaporan(String pesan, File? image) async {
    try {
      final authProvider = _ref.read(authRepoProvider);
      final (user, error) = await authProvider.isLogin();
      if (error != null) {
        throw AppAuthException("User belum login");
      }

      final desaId = user!.desa.id;

      String imageUrl = '';
      if (image != null) {
        final storage = FirebaseStorage.instance;
        String fileName =
            'camat_${DateTime.now().millisecondsSinceEpoch.toString()}';
        Reference dirUpload = storage.ref().child('uploads/$fileName');

        await dirUpload.putFile(image);
        imageUrl = await dirUpload.getDownloadURL();
      }

      final firestore = FirebaseFirestore.instance;
      CollectionReference laporanCollection = firestore.collection(
        'camatReports',
      );

      final id = laporanCollection.doc().id;

      await laporanCollection.doc(id).set(
            LaporanCamat(
              id: id,
              desaId: desaId,
              date: DateTime.now(),
              pesan: pesan,
              imageUrl: imageUrl,
            ).toJson(),
          );
    } catch (e) {
      throw AppException(
        'Gagal membuat laporan camat: ${e.toString()}',
      );
    }
  }

  @override
  Future<List<LaporanCamat>> getLaporan(int tahun, int bulan) async {
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
          .collection("camatReports")
          .where("date", isGreaterThanOrEqualTo: startTime, isLessThan: endTime)
          .where("villageId", isEqualTo: desaId)
          .get();

      final List<LaporanCamat> daftarLaporan = [];
      for (var document in querySnapshot.docs) {
        daftarLaporan.add(
          LaporanCamat(
            id: document.data()["id"],
            desaId: document.data()["villageId"],
            date: document.data()["date"].toDate(),
            imageUrl: document.data()["imageUrl"],
            pesan: document.data()["pesan"],
          ),
        );
      }

      return daftarLaporan;
    } catch (e) {
      throw AppException("Gagal mendapatkan laporan camat: ${e.toString()}");
    }
  }
}
