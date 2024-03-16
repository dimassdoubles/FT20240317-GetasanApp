import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/search_laporan_view.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/presentation/page/input_laporan_kegiatan_desa_page.dart';

class LaporKegiatanDesaUserView extends StatelessWidget {
  const LaporKegiatanDesaUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchLaporanView(
      icon: 'assets/icons/ic_laporan_kegiatan_desa.png',
      title: 'Laporan Kegiatan Desa',
      onAdd: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InputLaporanKegiatanDesaPage(),
          ),
        );
      },
    );
  }
}
