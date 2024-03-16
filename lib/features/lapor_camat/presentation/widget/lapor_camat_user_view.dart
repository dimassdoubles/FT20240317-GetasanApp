import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/search_laporan_view.dart';
import 'package:getasan_app/features/lapor_camat/presentation/page/input_lapor_camat_page.dart';

class LaporCamatUserView extends StatelessWidget {
  const LaporCamatUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchLaporanView(
      icon: 'assets/icons/ic_lapor_camat.png',
      title: 'Lapor Camat',
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
