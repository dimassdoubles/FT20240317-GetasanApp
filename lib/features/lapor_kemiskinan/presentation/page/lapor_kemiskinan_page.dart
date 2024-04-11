import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/lapor_kemiskinan/presentation/widget/lapor_kemiskinan_user_view.dart';

class LaporKemiskinanPage extends StatelessWidget {
  const LaporKemiskinanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GetasanAppBar(),
      body: LaporKemiskinanUserView(),
    );
  }
}
