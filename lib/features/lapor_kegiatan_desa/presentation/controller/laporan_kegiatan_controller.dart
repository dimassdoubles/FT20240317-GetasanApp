import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/common/helper/state_dialog_helper.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/domain/model/laporan_kegiatan_desa.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/domain/repo/laporan_kegiatan_repo.dart';

final laporanKegiatanControllerProvider = Provider(
  (ref) => LaporanKegiatanController(
    ref,
    ref.read(laporanKegiatanRepoProvider),
  ),
);

class LaporanKegiatanController {
  // ignore: unused_field
  final Ref _ref;
  final LaporanKegiatanRepo _repo;
  LaporanKegiatanController(this._ref, this._repo);

  final bulanProvider = StateProvider((ref) => 0);

  final tahunProvider = StateProvider((ref) => 0);

  final daftarLaporanProvider = StateProvider<List<LaporanKegiatanDesa>?>(
    (ref) => null,
  );

  Future<void> getLaporan(int year, int month) async {
    debugPrint("getLaporan kegiatan desa");
    final (data, error) = await _repo.getLaporan(year, month);

    final daftarLaporan = _ref.read(daftarLaporanProvider.notifier);

    if (error != null) {
      StateDialogHelper.showError(
        "",
        "Gagal mendapatkan data laporan: ${error.message}",
      );

      daftarLaporan.state = [];
    } else {
      debugPrint("berhasil dapat laporan kegiatan desa");
      debugPrint(data.toString());
      daftarLaporan.state = data;
    }
  }

  Future<bool> createLaporan({
    required String namaKegiatan,
    required String penanggungJawab,
    required DateTime tanggalKegiatan,
    required String hasilKegiatan,
    required String kendala,
    File? image,
  }) async {
    StateDialogHelper.showLoading();
    final (_, error) = await _repo.createLaporan(
      namaKegiatan: namaKegiatan,
      penanggungJawab: penanggungJawab,
      tanggalKegiatan: tanggalKegiatan,
      hasilKegiatan: hasilKegiatan,
      kendala: kendala,
      image: image,
    );
    StateDialogHelper.dismiss();

    if (error != null) {
      StateDialogHelper.showError('', error.message);
      return false;
    } else {
      StateDialogHelper.showSuccess("Laporan kegiatan desa telah dibuat");
      return true;
    }
  }
}
