import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/lapor_kematian/data/datasource/remote/firebase_laporan_kematian_datasource.dart';
import 'package:getasan_app/features/lapor_kematian/domain/models/laporan_kematian.dart';

final laporanKematianRemoteDatasourceProvider =
    Provider<LaporanKematianRemoteDatasource>(
  (ref) => FirebaseLaporanKematianDatasource(ref),
);

abstract class LaporanKematianRemoteDatasource {
  Future<void> createLaporan({
    required String nik,
    required String namaLengkap,
    required String alamat,
    required String tempatLahir,
    required DateTime tanggalLahir,
    required String tempatMeninggal,
    required DateTime tanggalMeninggal,
    required String namaPasanganDitinggal,
    required String namaAnakDitinggal,
    required String statusKawin,
  });

  Future<List<LaporanKematian>> getLaporan(int year, int month);
}
