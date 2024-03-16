import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/presentation/widget/lapor_kegiatan_desa_user_view.dart';

class LaporKegiatanDesaPage extends StatelessWidget {
  const LaporKegiatanDesaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GetasanAppBar(),
      body: LaporKegiatanDesaUserView(),
    );
  }
}
