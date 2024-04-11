import 'dart:io';

import 'package:getasan_app/features/common/constant/error/app_failure.dart';
import 'package:getasan_app/features/common/helper/repo_helper.dart';
import 'package:getasan_app/features/lapor_kemiskinan/data/datasource/remote/lapor_kemiskinan_remote_datasource.dart';
import 'package:getasan_app/features/lapor_kemiskinan/domain/models/laporan_kemiskinan.dart';
import 'package:getasan_app/features/lapor_kemiskinan/domain/repo/lapor_camat_repo.dart';

class LaporKemiskinanRepoImpl implements LaporKemiskinanRepo {
  final LaporKemiskinanRemoteDatasource _remoteDatasource;

  LaporKemiskinanRepoImpl(this._remoteDatasource);

  @override
  Future<(void, AppFailure?)> createLaporan({
    required String noKk,
    required String namaKepalaKeluarga,
    required String pekerjaan,
    required String alamat,
    required String titikKoordinat,
    File? gambarDepan,
    File? gambarBelakang,
  }) async {
    return await RepoHelper.callDatasource<void>(
      () async {
        return await _remoteDatasource.createLaporan(
          noKk: noKk,
          namaKepalaKeluarga: namaKepalaKeluarga,
          pekerjaan: pekerjaan,
          alamat: alamat,
          titikKoordinat: titikKoordinat,
        );
      },
    );
  }

  @override
  Future<(List<LaporanKemiskinan>?, AppFailure?)> getLaporan(
    int tahun,
    int bulan,
  ) async {
    return await RepoHelper.callDatasource<List<LaporanKemiskinan>>(
      () async {
        return await _remoteDatasource.getLaporan(tahun, bulan);
      },
    );
  }
}
