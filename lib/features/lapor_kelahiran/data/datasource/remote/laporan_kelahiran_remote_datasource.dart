import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/lapor_kelahiran/data/datasource/remote/firebase_laporan_kelahiran_datasource.dart';
import 'package:getasan_app/features/lapor_kelahiran/domain/model/laporan_kelahiran.dart';

final laporanKelahiranRemoteDatasourceProvider =
    Provider<LaporanKelahiranRemoteDatasource>(
  (ref) => FirebaseLaporanKelahiranDatasource(ref),
);

abstract class LaporanKelahiranRemoteDatasource {
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
  });

  Future<List<LaporanKelahiran>> getLaporan(int year, int month);
}
