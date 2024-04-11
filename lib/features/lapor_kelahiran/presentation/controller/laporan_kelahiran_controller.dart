import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/common/helper/state_dialog_helper.dart';
import 'package:getasan_app/features/lapor_kelahiran/domain/model/laporan_kelahiran.dart';
import 'package:getasan_app/features/lapor_kelahiran/domain/repo/lapor_kelahiran_repo.dart';

final laporanKelahiranControllerProvider = Provider(
  (ref) => LaporanKelahiranController(
    ref,
    ref.read(laporanKelahiranRepoProvider),
  ),
);

class LaporanKelahiranController {
  final LaporanKelahiranRepo _repo;
  // ignore: unused_field
  final Ref _ref;
  LaporanKelahiranController(this._ref, this._repo);

  final bulanProvider = StateProvider((ref) => 0);

  final tahunProvider = StateProvider((ref) => 0);

  final createLaporanKelahiranParamProvider = StateProvider<LaporanKelahiran>(
    (ref) => LaporanKelahiran(tanggalLahir: DateTime.now()),
  );

  final daftarLaporanProvider = StateProvider<List<LaporanKelahiran>?>(
    (ref) => null,
  );

  void setParam(LaporanKelahiran laporan) {
    _ref.read(createLaporanKelahiranParamProvider.notifier).state = laporan;
  }

  Future<void> getLaporan(int year, int month) async {
    _ref.read(tahunProvider.notifier).state = year;
    _ref.read(bulanProvider.notifier).state = month - 1;

    debugPrint("getLaporan kelahiran");
    final (data, error) = await _repo.getLaporan(year, month);
    debugPrint("Sampai sini");

    final daftarLaporan = _ref.read(daftarLaporanProvider.notifier);

    if (error != null) {
      StateDialogHelper.showError(
        "",
        "Gagal mendapatkan data laporan: ${error.message}",
      );

      daftarLaporan.state = [];
    } else {
      debugPrint("berhasil dapat laporan kelahiran");
      debugPrint(data.toString());
      daftarLaporan.state = data;
    }
  }

  Future<bool> createLaporan() async {
    StateDialogHelper.showLoading();
    final laporan = _ref.read(createLaporanKelahiranParamProvider);
    final (_, error) = await _repo.createLaporan(
      id: laporan.id,
      desaId: laporan.desaId,
      noKk: laporan.noKk,
      namaBayi: laporan.namaBayi,
      anakKe: laporan.anakKe,
      jenisKelamin: laporan.jenisKelamin,
      jamKelahiran: laporan.jamKelahiran,
      menitKelahiran: laporan.menitKelahiran,
      tempatLahir: laporan.tempatLahir,
      tanggalLahir: laporan.tanggalLahir,
      namaAyah: laporan.namaAyah,
      pekerjaanAyah: laporan.pekerjaanAyah,
      alamatRumahAyah: laporan.alamatRumahAyah,
      nikAyah: laporan.nikAyah,
      noHpAyah: laporan.noHpAyah,
      emailAyah: laporan.emailAyah,
      namaIbu: laporan.namaIbu,
      pekerjaanIbu: laporan.pekerjaanIbu,
      alamatRumahIbu: laporan.alamatRumahIbu,
      nikIbu: laporan.nikIbu,
      emailIbu: laporan.emailIbu,
    );
    StateDialogHelper.dismiss();

    if (error != null) {
      StateDialogHelper.showError('', error.message);
      return false;
    } else {
      StateDialogHelper.showSuccess("Laporan kelahiran telah dibuat");
      return true;
    }
  }
}
