import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/common/presentation/widget/search_laporan_view.dart';
import 'package:getasan_app/features/lapor_camat/presentation/controller/input_laporan_camat_controller.dart';
import 'package:getasan_app/features/lapor_camat/presentation/page/daftar_laporan_camat_page.dart';
import 'package:getasan_app/features/lapor_camat/presentation/page/input_lapor_camat_page.dart';

class LaporCamatUserView extends ConsumerWidget {
  const LaporCamatUserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(inputLaporanCamatControllerProvider);

    return SearchLaporanView(
      icon: 'assets/icons/ic_lapor_camat.png',
      title: 'Lapor Camat',
      onSearch: (bulan, tahun) {
        debugPrint("tahun dan bulan terpilih: bulan $bulan, tahun $tahun");
        controller.getLaporan(tahun, bulan);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DaftarLaporanCamatPage(),
          ),
        );
      },
      onAdd: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InputLaporCamatPage(),
          ),
        );
      },
    );
  }
}
