import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/lapor_camat/data/datasource/remote/lapor_camat_firebase_datasource.dart';
import 'package:getasan_app/features/lapor_camat/domain/models/laporan_camat.dart';

final laporCamatRemoteDatasourceProvider = Provider<LaporCamatRemoteDatasource>(
  (ref) => LaporCamatFirebaseDatasource(ref),
);

abstract class LaporCamatRemoteDatasource {
  Future<void> createLaporan(String pesan, File? image);
  Future<List<LaporanCamat>> getLaporan(int tahun, int bulan);
}
