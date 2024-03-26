import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:getasan_app/features/common/constant/error/app_exception.dart';
import 'package:getasan_app/features/lapor_camat/data/datasource/remote/lapor_camat_remote_datasource.dart';
import 'package:getasan_app/features/lapor_camat/domain/models/laporan_camat.dart';

class LaporCamatFirebaseDatasource implements LaporCamatRemoteDatasource {
  @override
  Future<void> createLaporan(String pesan, File? image) async {
    try {
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
}
