import 'dart:io';

import 'package:getasan_app/features/common/constant/error/app_failure.dart';
import 'package:getasan_app/features/common/helper/repo_helper.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/data/datasource/remote/laporan_kegiatan_remote_datasource.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/domain/model/laporan_kegiatan_desa.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/domain/repo/laporan_kegiatan_repo.dart';

class LaporanKegiatanRepoImpl implements LaporanKegiatanRepo {
  final LaporanKegiatanRemoteDatasource _remoteDatasource;

  LaporanKegiatanRepoImpl(this._remoteDatasource);

  @override
  Future<(void, AppFailure?)> createLaporan({
    required String namaKegiatan,
    required String penanggungJawab,
    required DateTime tanggalKegiatan,
    required String hasilKegiatan,
    required String kendala,
    File? image,
  }) async {
    return await RepoHelper.callDatasource<void>(() async {
      return await _remoteDatasource.createLaporan(
        namaKegiatan: namaKegiatan,
        penanggungJawab: penanggungJawab,
        tanggalKegiatan: tanggalKegiatan,
        hasilKegiatan: hasilKegiatan,
        kendala: kendala,
        image: image,
      );
    });
  }

  @override
  Future<(List<LaporanKegiatanDesa>?, AppFailure?)> getLaporan(
    int year,
    int month,
  ) async {
    return await RepoHelper.callDatasource<List<LaporanKegiatanDesa>?>(
      () async {
        return await _remoteDatasource.getLaporan(year, month);
      },
    );
  }
}
