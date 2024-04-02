import 'package:getasan_app/features/common/constant/error/app_failure.dart';
import 'package:getasan_app/features/common/helper/repo_helper.dart';
import 'package:getasan_app/features/lapor_kematian/data/datasource/remote/laporan_kematian_remote_datasource.dart';
import 'package:getasan_app/features/lapor_kematian/domain/models/laporan_kematian.dart';
import 'package:getasan_app/features/lapor_kematian/domain/repo/laporan_kematian_repo.dart';

class LaporanKematianRepoImpl implements LaporanKematianRepo {
  final LaporanKematianRemoteDatasource _remoteDatasouce;
  LaporanKematianRepoImpl(this._remoteDatasouce);

  @override
  Future<(void, AppFailure?)> createLaporan({
    required String nik,
    required String namaLengkap,
    required String alamat,
    required String tempatLahir,
    required DateTime tanggalLahir,
    required String tempatMeninggal,
    required DateTime tanggalMeninggal,
    String namaPasanganDitinggal = "-",
    String namaAnakDitinggal = "-",
    required String statusKawin,
  }) async {
    return await RepoHelper.callDatasource<void>(
      () async {
        return await _remoteDatasouce.createLaporan(
          nik: nik,
          namaLengkap: namaLengkap,
          alamat: alamat,
          tempatLahir: tempatLahir,
          tanggalLahir: tanggalLahir,
          tempatMeninggal: tempatMeninggal,
          tanggalMeninggal: tanggalMeninggal,
          statusKawin: statusKawin,
          namaAnakDitinggal: namaAnakDitinggal,
          namaPasanganDitinggal: namaPasanganDitinggal,
        );
      },
    );
  }

  @override
  Future<(List<LaporanKematian>?, AppFailure?)> getLaporan(
      int year, int month) async {
    return await RepoHelper.callDatasource<List<LaporanKematian>?>(
      () async {
        return await _remoteDatasouce.getLaporan(year, month);
      },
    );
  }
}
