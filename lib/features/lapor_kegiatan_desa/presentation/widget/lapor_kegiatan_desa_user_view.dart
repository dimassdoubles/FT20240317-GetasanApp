import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/search_laporan_view.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/presentation/controller/laporan_kegiatan_controller.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/presentation/page/daftar_laporan_kegiatan_desa_page.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/presentation/page/input_laporan_kegiatan_desa_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LaporKegiatanDesaUserView extends HookConsumerWidget {
  const LaporKegiatanDesaUserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(laporanKegiatanControllerProvider);

    return SearchLaporanView(
      icon: 'assets/icons/ic_laporan_kegiatan_desa.png',
      title: 'Laporan Kegiatan Desa',
      onSearch: (bulan, tahun) {
        controller.getLaporan(tahun, bulan);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DaftarLaporanKegiatanDesaPage(),
          ),
        );
      },
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
