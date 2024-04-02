import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/search_laporan_view.dart';
import 'package:getasan_app/features/lapor_kematian/presentation/controller/laporan_kematian_controller.dart';
import 'package:getasan_app/features/lapor_kematian/presentation/page/daftar_laporan_kematian_page.dart';
import 'package:getasan_app/features/lapor_kematian/presentation/page/input_laporan_kematian_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LaporKematianUserView extends HookConsumerWidget {
  const LaporKematianUserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(laporanKematianControllerProvider);

    return SearchLaporanView(
      icon: 'assets/icons/ic_laporan_kematian.png',
      title: 'Laporan Kematian',
      onSearch: (bulan, tahun) {
        controller.getLaporan(tahun, bulan);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DaftarLaporanKematianPage(),
          ),
        );
      },
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
