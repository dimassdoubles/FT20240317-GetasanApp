import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/common/helper/date_time_helper.dart';
import 'package:getasan_app/features/common/helper/state_dialog_helper.dart';
import 'package:getasan_app/features/lapor_kemiskinan/domain/models/laporan_kemiskinan.dart';
import 'package:getasan_app/features/lapor_kemiskinan/domain/repo/lapor_kemiskinan_repo.dart';

final inputLaporanKemiskinanControllerProvider = Provider(
  (ref) => InputLaporanKemiskinanController(
    ref,
    ref.read(laporKemiskinanRepoProvider),
  ),
);

class InputLaporanKemiskinanController {
  final Ref _ref;
  final LaporKemiskinanRepo _repo;

  InputLaporanKemiskinanController(
    this._ref,
    this._repo,
  );
  final loadingProvider = StateProvider<bool>((ref) => true);
  final laporanKemiskinanProvider = StateProvider<List<LaporanKemiskinan>?>(
    (ref) => null,
  );
  final tahunProvider = StateProvider<int>((ref) => 0);
  final bulanProvider = StateProvider<String>((ref) => "");

  final selectedGambarDepanProvider = StateProvider<XFile?>((ref) => null);
  final selectedGambarBelakangProvider = StateProvider<XFile?>((ref) => null);

  final TextEditingController namaKepalaKeluargaCtrl = TextEditingController();
  final TextEditingController nokkCtrl = TextEditingController();
  final TextEditingController pekerjaanCtrl = TextEditingController();
  final TextEditingController pendapatanCtrl = TextEditingController();
  final TextEditingController alamatCtrl = TextEditingController();
  final TextEditingController titikKoordinatCtrl = TextEditingController();

  void onSelectedGambarDepan(XFile? image) {
    _ref.read(selectedGambarDepanProvider.notifier).state = image;
  }

  void deleteGambarDepan() {
    _ref.read(selectedGambarDepanProvider.notifier).state = null;
  }

  void onSelectedGambarBelakang(XFile? image) {
    _ref.read(selectedGambarBelakangProvider.notifier).state = image;
  }

  void deleteGambarBelakang() {
    _ref.read(selectedGambarBelakangProvider.notifier).state = null;
  }

  Future<bool> createLaporan() async {
    debugPrint('Hallo create laporan dimulai');
    try {
      StateDialogHelper.showLoading();
      final xfileGambarDepan = _ref.read(selectedGambarDepanProvider);
      final xfileGambarBelakang = _ref.read(selectedGambarBelakangProvider);

      final (_, err) = await _repo.createLaporan(
        noKk: nokkCtrl.text,
        namaKepalaKeluarga: namaKepalaKeluargaCtrl.text,
        pekerjaan: pekerjaanCtrl.text,
        alamat: alamatCtrl.text,
        titikKoordinat: titikKoordinatCtrl.text,
        pendapatan: int.parse(pendapatanCtrl.text),
        gambarDepan:
            xfileGambarDepan != null ? File(xfileGambarDepan.path) : null,
        gambarBelakang:
            xfileGambarBelakang != null ? File(xfileGambarBelakang.path) : null,
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
        StateDialogHelper.showSuccess('Laporan kemiskinan berhasil dibuat');

        namaKepalaKeluargaCtrl.clear();
        nokkCtrl.clear();
        pekerjaanCtrl.clear();
        pendapatanCtrl.clear();
        alamatCtrl.clear();
        titikKoordinatCtrl.clear();
        deleteGambarDepan();
        deleteGambarBelakang();
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
      _ref.read(laporanKemiskinanProvider.notifier).state = data;
    }
  }
}
