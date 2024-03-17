import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';

class DetailLaporanKegiatanDesaListItem extends StatelessWidget {
  final String penanggungJawab;
  final String waktu;
  final String hasilKegiatan;
  final String kendala;
  final String? photoUrl;
  const DetailLaporanKegiatanDesaListItem({
    super.key,
    required this.penanggungJawab,
    required this.waktu,
    required this.hasilKegiatan,
    required this.kendala,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Penanggung jawab kegiatan'),
        Gaps.v4,
        Text(penanggungJawab),
        Gaps.v16,
        const Text('Waktu'),
        Gaps.v4,
        Text(waktu),
        Gaps.v16,
        const Text('Hasil Kegiatan'),
        Gaps.v4,
        Text(hasilKegiatan),
        Gaps.v16,
        const Text('Kendala'),
        Gaps.v4,
        Text(kendala),
        Gaps.v16,
        const Text('Foto'),
        if (photoUrl == null)
          Center(
            child: Icon(
              Icons.image,
              color: AppColors.primary300,
              size: 150.w,
            ),
          ),
        Gaps.v16,
      ],
    );
  }
}
