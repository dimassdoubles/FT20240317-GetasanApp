import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/search_laporan_view.dart';
import 'package:getasan_app/features/lapor_kelahiran/presentation/page/input_laporan_kelahiran_page.dart';

class LaporKelahiranUserView extends StatelessWidget {
  const LaporKelahiranUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchLaporanView(
      icon: 'assets/icons/ic_laporan_kelahiran.png',
      title: 'Laporan Kelahiran',
      onAdd: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InputLaporanKelahiranPage(),
            ));
      },
    );
  }
}
