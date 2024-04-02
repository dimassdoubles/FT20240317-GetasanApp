import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/common/helper/state_dialog_helper.dart';
import 'package:getasan_app/features/lapor_kematian/domain/models/laporan_kematian.dart';
import 'package:getasan_app/features/lapor_kematian/domain/repo/laporan_kematian_repo.dart';

final laporanKematianControllerProvider = Provider(
  (ref) => LaporanKematianController(
    ref,
    ref.read(laporanKematianRepoProvider),
  ),
);

class LaporanKematianController {
  final LaporanKematianRepo _repo;
  // ignore: unused_field
  final Ref _ref;
  LaporanKematianController(this._ref, this._repo);

  final bulanProvider = StateProvider((ref) => 0);

  final tahunProvider = StateProvider((ref) => 0);

  final daftarLaporanProvider = StateProvider<List<LaporanKematian>?>(
    (ref) => null,
  );

  Future<void> getLaporan(int year, int month) async {
    _ref.read(tahunProvider.notifier).state = year;
    _ref.read(bulanProvider.notifier).state = month - 1;

    debugPrint("getLaporan kematian");
    final (data, error) = await _repo.getLaporan(year, month);

    final daftarLaporan = _ref.read(daftarLaporanProvider.notifier);

    if (error != null) {
      StateDialogHelper.showError(
        "",
        "Gagal mendapatkan data laporan: ${error.message}",
      );

      daftarLaporan.state = [];
    } else {
      debugPrint("berhasil dapat laporan kematian");
      debugPrint(data.toString());
      daftarLaporan.state = data;
    }
  }

  Future<bool> createLaporan({
    required String nik,
    required String namaLengkap,
    required String alamat,
    required String tempatLahir,
    required DateTime tanggalLahir,
    required String tempatMeninggal,
    required DateTime tanggalMeninggal,
    required String namaPasanganDitinggal,
    required String namaAnakDitinggal,
    required String statusKawin,
  }) async {
    StateDialogHelper.showLoading();
    final (_, error) = await _repo.createLaporan(
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
    StateDialogHelper.dismiss();

    if (error != null) {
      StateDialogHelper.showError('', error.message);
      return false;
    } else {
      StateDialogHelper.showSuccess("Laporan kematian telah dibuat");
      return true;
    }
  }
}
