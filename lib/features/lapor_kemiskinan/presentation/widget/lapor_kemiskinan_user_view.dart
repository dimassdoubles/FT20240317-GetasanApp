import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/common/presentation/widget/search_laporan_view.dart';
import 'package:getasan_app/features/lapor_kemiskinan/presentation/controller/input_laporan_kemiskinan_controller.dart';
import 'package:getasan_app/features/lapor_kemiskinan/presentation/page/daftar_laporan_kemiskinan_page.dart';
import 'package:getasan_app/features/lapor_kemiskinan/presentation/page/input_lapor_kemiskinan_page.dart';

class LaporKemiskinanUserView extends ConsumerWidget {
  const LaporKemiskinanUserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(inputLaporanKemiskinanControllerProvider);

    return SearchLaporanView(
      icon: 'assets/icons/ic_laporan_kemiskinan.png',
      title: 'Lapor Kemiskinan',
      onSearch: (bulan, tahun) {
        debugPrint("tahun dan bulan terpilih: bulan $bulan, tahun $tahun");
        controller.getLaporan(tahun, bulan);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DaftarLaporanKemiskinanPage(),
          ),
        );
      },
      onAdd: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InputLaporKemiskinanPage(),
          ),
        );
      },
    );
  }
}
