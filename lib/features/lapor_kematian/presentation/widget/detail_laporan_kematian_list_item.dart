import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';

class DetailLaporanKematianListItem extends StatelessWidget {
  final String nik;
  final String alamatRumah;
  final String tempatLahir;
  final String tempatMeninggal;
  final String pasanganDitinggal;
  final String anakDitinggal;
  final String statusKawin;

  const DetailLaporanKematianListItem({
    super.key,
    required this.nik,
    required this.alamatRumah,
    required this.tempatLahir,
    required this.tempatMeninggal,
    required this.pasanganDitinggal,
    required this.anakDitinggal,
    required this.statusKawin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('NIK'),
        Gaps.v2,
        Text('    $nik'),
        Gaps.v8,
        const Text('Alamat Rumah'),
        Gaps.v2,
        Text('    $alamatRumah'),
        Gaps.v8,
        const Text('Tempat Lahir'),
        Gaps.v2,
        Text('    $tempatLahir'),
        Gaps.v8,
        const Text('Tempat Meninggal'),
        Gaps.v2,
        Text('    $tempatMeninggal'),
        Gaps.v8,
        const Text('Nama Suami/Istri Yang Ditinggalkan'),
        Gaps.v2,
        Text('    $pasanganDitinggal'),
        Gaps.v8,
        const Text('Nama Anak Yang Ditinggalkan'),
        Gaps.v2,
        Text('    $anakDitinggal'),
        Gaps.v8,
        const Text('Status Kawin'),
        Gaps.v2,
        Text('    $statusKawin'),
        Gaps.v16,
      ],
    );
  }
}
