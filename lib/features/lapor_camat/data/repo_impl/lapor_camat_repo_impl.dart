import 'dart:io';

import 'package:getasan_app/features/common/constant/error/app_failure.dart';
import 'package:getasan_app/features/common/helper/repo_helper.dart';
import 'package:getasan_app/features/lapor_camat/data/datasource/remote/lapor_camat_remote_datasource.dart';
import 'package:getasan_app/features/lapor_camat/domain/models/laporan_camat.dart';
import 'package:getasan_app/features/lapor_camat/domain/repo/lapor_camat_repo.dart';

class LaporCamatRepoImpl implements LaporCamatRepo {
  final LaporCamatRemoteDatasource _remoteDatasource;

  LaporCamatRepoImpl(this._remoteDatasource);

  @override
  Future<(void, AppFailure?)> createLaporan(String pesan, File? foto) async {
    return await RepoHelper.callDatasource<void>(
      () async {
        return await _remoteDatasource.createLaporan(pesan, foto);
      },
    );
  }

  @override
  Future<(List<LaporanCamat>?, AppFailure?)> getLaporan(
    int tahun,
    int bulan,
  ) async {
    return await RepoHelper.callDatasource<List<LaporanCamat>>(
      () async {
        return await _remoteDatasource.getLaporan(tahun, bulan);
      },
    );
  }
}
