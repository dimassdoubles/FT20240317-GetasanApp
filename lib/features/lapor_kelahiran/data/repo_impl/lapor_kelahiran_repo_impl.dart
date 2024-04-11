import 'package:getasan_app/features/common/constant/error/app_failure.dart';
import 'package:getasan_app/features/common/helper/repo_helper.dart';
import 'package:getasan_app/features/lapor_kelahiran/data/datasource/remote/laporan_kelahiran_remote_datasource.dart';
import 'package:getasan_app/features/lapor_kelahiran/domain/model/laporan_kelahiran.dart';
import 'package:getasan_app/features/lapor_kelahiran/domain/repo/lapor_kelahiran_repo.dart';

class LaporanKelahiranRepoImpl implements LaporanKelahiranRepo {
  final LaporanKelahiranRemoteDatasource _remoteDatasouce;
  LaporanKelahiranRepoImpl(this._remoteDatasouce);

  @override
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
  }) async {
    return await RepoHelper.callDatasource<void>(
      () async {
        return await _remoteDatasouce.createLaporan(
          id: id,
          desaId: desaId,
          noKk: noKk,
          namaBayi: namaBayi,
          anakKe: anakKe,
          jenisKelamin: jenisKelamin,
          jamKelahiran: jamKelahiran,
          menitKelahiran: menitKelahiran,
          tempatLahir: tempatLahir,
          tanggalLahir: tanggalLahir,
          namaAyah: namaAyah,
          pekerjaanAyah: pekerjaanAyah,
          alamatRumahAyah: alamatRumahAyah,
          nikAyah: nikAyah,
          noHpAyah: noHpAyah,
          emailAyah: emailAyah,
          namaIbu: namaIbu,
          pekerjaanIbu: pekerjaanIbu,
          alamatRumahIbu: alamatRumahIbu,
          nikIbu: nikIbu,
          emailIbu: emailIbu,
        );
      },
    );
  }

  @override
  Future<(List<LaporanKelahiran>?, AppFailure?)> getLaporan(
      int year, int month) async {
    return await RepoHelper.callDatasource<List<LaporanKelahiran>?>(
      () async {
        return await _remoteDatasouce.getLaporan(year, month);
      },
    );
  }
}
