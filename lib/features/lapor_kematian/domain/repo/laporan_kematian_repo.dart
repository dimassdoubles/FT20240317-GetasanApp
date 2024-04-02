import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/common/constant/error/app_failure.dart';
import 'package:getasan_app/features/lapor_kematian/data/datasource/remote/laporan_kematian_remote_datasource.dart';
import 'package:getasan_app/features/lapor_kematian/data/repo_impl/laporan_kematian_repo_impl.dart';
import 'package:getasan_app/features/lapor_kematian/domain/models/laporan_kematian.dart';

final laporanKematianRepoProvider = Provider<LaporanKematianRepo>(
  (ref) => LaporanKematianRepoImpl(
    ref.read(laporanKematianRemoteDatasourceProvider),
  ),
);

abstract class LaporanKematianRepo {
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
  });

  Future<(List<LaporanKematian>?, AppFailure?)> getLaporan(int year, int month);
}
