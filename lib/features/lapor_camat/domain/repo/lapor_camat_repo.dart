import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/common/constant/error/app_failure.dart';
import 'package:getasan_app/features/lapor_camat/data/datasource/remote/lapor_camat_remote_datasource.dart';
import 'package:getasan_app/features/lapor_camat/data/repo_impl/lapor_camat_repo_impl.dart';
import 'package:getasan_app/features/lapor_camat/domain/models/laporan_camat.dart';

final laporCamatRepoProvider = Provider<LaporCamatRepo>(
  (ref) => LaporCamatRepoImpl(
    ref.read(laporCamatRemoteDatasourceProvider),
  ),
);

abstract class LaporCamatRepo {
  Future<(void, AppFailure?)> createLaporan(String pesan, File? foto);
  Future<(List<LaporanCamat>?, AppFailure?)> getLaporan(
    int tahun,
    int bulan,
  );
}
