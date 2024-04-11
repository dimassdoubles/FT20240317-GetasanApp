import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/common/constant/error/app_failure.dart';
import 'package:getasan_app/features/lapor_kemiskinan/data/datasource/remote/lapor_kemiskinan_remote_datasource.dart';
import 'package:getasan_app/features/lapor_kemiskinan/data/repo_impl/lapor_kemiskinan_repo_impl.dart';
import 'package:getasan_app/features/lapor_kemiskinan/domain/models/laporan_kemiskinan.dart';

final laporCamatRepoProvider = Provider<LaporKemiskinanRepo>(
  (ref) => LaporKemiskinanRepoImpl(
    ref.read(laporKemiskinanRemoteDatasourceProvider),
  ),
);

abstract class LaporKemiskinanRepo {
  Future<(void, AppFailure?)> createLaporan({
    required String noKk,
    required String namaKepalaKeluarga,
    required String pekerjaan,
    required String alamat,
    required String titikKoordinat,
    File? gambarDepan,
    File? gambarBelakang,
  });
  Future<(List<LaporanKemiskinan>?, AppFailure?)> getLaporan(
    int tahun,
    int bulan,
  );
}
