import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/data/datasource/remote/firebase_laporan_kegiatan_datasource.dart';

final laporanKegiatanRemoteDatasourceProvider =
    Provider<LaporanKegiatanRemoteDatasource>(
  (ref) => FirebaseLaporanKegiatanDatasource(ref),
);

abstract class LaporanKegiatanRemoteDatasource {
  Future<void> createLaporan({
    required String namaKegiatan,
    required String penanggungJawab,
    required DateTime tanggalKegiatan,
    required String hasilKegiatan,
    required String kendala,
    File? image,
  });
}
