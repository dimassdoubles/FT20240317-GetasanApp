import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';

class DetailLaporanKelahiranListItem extends StatelessWidget {
  final String noKK;
  final String anakKe;
  final String jenisKelamin;
  final String jamKelahiran;
  final String tempatLahir;
  final String tanggalLahir;
  final String namaAyah;
  final String pekerjaanAyah;
  final String alamatRumahAyah;
  final String nikAyah;
  final String noHpAyah;
  final String emailAyah;
  final String namaIbu;
  final String pekerjaanIbu;
  final String alamatRumahIbu;
  final String nikIbu;
  final String noHpIbu;
  final String emailIbu;

  const DetailLaporanKelahiranListItem({
    super.key,
    required this.noKK,
    required this.anakKe,
    required this.jenisKelamin,
    required this.jamKelahiran,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.namaAyah,
    required this.pekerjaanAyah,
    required this.alamatRumahAyah,
    required this.nikAyah,
    required this.noHpAyah,
    required this.emailAyah,
    required this.namaIbu,
    required this.pekerjaanIbu,
    required this.alamatRumahIbu,
    required this.nikIbu,
    required this.noHpIbu,
    required this.emailIbu,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Data Bayi'),
        Gaps.v8,
        const Text('a. No Kartu Keluarga'),
        Text('    $noKK'),
        Gaps.v4,
        const Text('b. Anak Ke'),
        Text('    $anakKe'),
        Gaps.v4,
        const Text('c. Jenis Kelamin'),
        Text('    $jenisKelamin'),
        Gaps.v4,
        const Text('d. Jam Kelahiran'),
        Text('    $jamKelahiran'),
        Gaps.v4,
        const Text('e. Tempat Lahir'),
        Text('    $tempatLahir'),
        Gaps.v4,
        const Text('f. Tanggal Lahir'),
        Text('    $tanggalLahir'),
        Gaps.v16,
        const Text('Data Ayah'),
        const Text('a. Nama'),
        Text('    $namaAyah'),
        Gaps.v4,
        const Text('b. Pekerjaan'),
        Text('    $pekerjaanAyah'),
        Gaps.v4,
        const Text('c. Alamat Rumah'),
        Text('    $alamatRumahAyah'),
        Gaps.v4,
        const Text('d. NIK'),
        Text('    $nikAyah'),
        Gaps.v4,
        const Text('e. No HP'),
        Text('    $noHpAyah'),
        Gaps.v4,
        const Text('f. Email'),
        Text('    $emailAyah'),
        Gaps.v16,
        const Text('Data Ibu'),
        const Text('a. Nama'),
        Text('    $namaIbu'),
        Gaps.v4,
        const Text('b. Pekerjaan'),
        Text('    $pekerjaanIbu'),
        Gaps.v4,
        const Text('c. Alamat Rumah'),
        Text('    $alamatRumahIbu'),
        Gaps.v4,
        const Text('d. NIK'),
        Text('    $nikIbu'),
        Gaps.v4,
        const Text('e. No HP'),
        Text('    $noHpIbu'),
        Gaps.v4,
        const Text('f. Email'),
        Text('    $emailIbu'),
        Gaps.v4,
      ],
    );
  }
}
