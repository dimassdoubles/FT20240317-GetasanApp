import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/common/constant/error/app_failure.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/data/datasource/remote/laporan_kegiatan_remote_datasource.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/data/repo_impl/laporan_kegiatan_repo_impl.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/domain/model/laporan_kegiatan_desa.dart';

final laporanKegiatanRepoProvider = Provider<LaporanKegiatanRepo>(
  (ref) => LaporanKegiatanRepoImpl(
    ref.read(laporanKegiatanRemoteDatasourceProvider),
  ),
);

abstract class LaporanKegiatanRepo {
  Future<(void, AppFailure?)> createLaporan({
    required String namaKegiatan,
    required String penanggungJawab,
    required DateTime tanggalKegiatan,
    required String hasilKegiatan,
    required String kendala,
    File? image,
  });

  Future<(List<LaporanKegiatanDesa>?, AppFailure?)> getLaporan(
    int year,
    int month,
  );
}
