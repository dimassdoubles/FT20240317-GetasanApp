import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/common/helper/state_dialog_helper.dart';
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
