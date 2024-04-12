import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/common/helper/date_time_helper.dart';
import 'package:getasan_app/features/common/helper/state_dialog_helper.dart';
import 'package:getasan_app/features/lapor_camat/domain/models/laporan_camat.dart';
import 'package:getasan_app/features/lapor_camat/domain/repo/lapor_camat_repo.dart';

final inputLaporanCamatControllerProvider = Provider(
  (ref) => InputLaporanCamatController(
    ref,
    ref.read(laporCamatRepoProvider),
  ),
);

class InputLaporanCamatController {
  final Ref _ref;
  final LaporCamatRepo _repo;

  InputLaporanCamatController(
    this._ref,
    this._repo,
  );
  final loadingProvider = StateProvider<bool>((ref) => true);
  final laporanCamatProvider = StateProvider<List<LaporanCamat>?>(
    (ref) => null,
  );
  final tahunProvider = StateProvider<int>((ref) => 0);
  final bulanProvider = StateProvider<String>((ref) => "");

  final selectedImageProvider = StateProvider<XFile?>((ref) => null);

  final TextEditingController pesanController = TextEditingController();

  void onSelectedImage(XFile? image) {
    _ref.read(selectedImageProvider.notifier).state = image;
  }

  void deleteImage() {
    _ref.read(selectedImageProvider.notifier).state = null;
  }

  Future<bool> createLaporan() async {
    debugPrint('Hallo create laporan dimulai');
    try {
      StateDialogHelper.showLoading();
      final xFileImage = _ref.read(selectedImageProvider);

      final (_, err) = await _repo.createLaporan(
        pesanController.text,
        xFileImage != null ? File(xFileImage.path) : null,
      );
      StateDialogHelper.dismiss();
      debugPrint('Hallo broooo');
      if (err != null) {
        StateDialogHelper.showError(
          'Gagal Membuat Laporan',
          'Keterangan: ${err.message}',
        );
        return false;
      } else {
        StateDialogHelper.showSuccess('Laporan camat berhasil dibuat');
        pesanController.text = '';
        deleteImage();
        return true;
      }
    } catch (e) {
      StateDialogHelper.dismiss();
      StateDialogHelper.showError(
        'Gagal Membuat Laporan',
        'Keterangan: ${e.toString()}',
      );
      return false;
    }
  }

  void getLaporan(int tahun, int bulan) async {
    _ref.read(tahunProvider.notifier).state = tahun;
    _ref.read(bulanProvider.notifier).state = DateTimeHelper.months[bulan - 1];

    debugPrint("getLaporan camat");
    _ref.read(loadingProvider.notifier).state = true;
    final (data, error) = await _repo.getLaporan(tahun, bulan);
    _ref.read(loadingProvider.notifier).state = false;
    if (error != null) {
      StateDialogHelper.showError('', error.message);
    } else {
      _ref.read(laporanCamatProvider.notifier).state = data;
    }
  }
}
