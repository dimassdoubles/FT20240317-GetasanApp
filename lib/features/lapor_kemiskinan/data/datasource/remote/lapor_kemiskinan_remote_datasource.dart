import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/lapor_kemiskinan/data/datasource/remote/lapor_kemiskinan_firebase_datasource.dart';
import 'package:getasan_app/features/lapor_kemiskinan/domain/models/laporan_kemiskinan.dart';

final laporKemiskinanRemoteDatasourceProvider =
    Provider<LaporKemiskinanRemoteDatasource>(
  (ref) => LaporKemiskinanFirebaseDatasource(ref),
);

abstract class LaporKemiskinanRemoteDatasource {
  Future<void> createLaporan({
    required String noKk,
    required String namaKepalaKeluarga,
    required String pekerjaan,
    required String alamat,
    required String titikKoordinat,
    File? gambarDepan,
    File? gambarBelakang,
  });
  Future<List<LaporanKemiskinan>> getLaporan(int tahun, int bulan);
}
