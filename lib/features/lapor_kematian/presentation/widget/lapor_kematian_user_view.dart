import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/search_laporan_view.dart';
import 'package:getasan_app/features/lapor_kematian/presentation/page/input_laporan_kematian_page.dart';

class LaporKematianUserView extends StatelessWidget {
  const LaporKematianUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchLaporanView(
      icon: 'assets/icons/ic_laporan_kematian.png',
      title: 'Laporan Kematian',
      onAdd: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InputLaporanKematianPage(),
          ),
        );
      },
    );
  }
}
