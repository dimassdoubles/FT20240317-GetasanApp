import 'package:getasan_app/features/common/constant/error/app_failure.dart';
import 'package:getasan_app/features/lapor_kelahiran/data/datasource/remote/laporan_kelahiran_remote_datasource.dart';
import 'package:getasan_app/features/lapor_kelahiran/data/repo_impl/laporan_kelahiran_repo_impl.dart';
import 'package:getasan_app/features/lapor_kelahiran/domain/model/laporan_kelahiran.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final laporanKelahiranRepoProvider = Provider<LaporanKelahiranRepo>(
  (ref) => LaporanKelahiranRepoImpl(
    ref.read(laporanKelahiranRemoteDatasourceProvider),
  ),
);

abstract class LaporanKelahiranRepo {
  Future<(void, AppFailure?)> createLaporan({
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

  Future<(List<LaporanKelahiran>?, AppFailure?)> getLaporan(
      int year, int month);
}
