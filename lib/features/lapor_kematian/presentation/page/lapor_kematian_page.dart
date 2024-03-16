import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/lapor_kematian/presentation/widget/lapor_kematian_user_view.dart';

class LaporKematianPage extends StatelessWidget {
  const LaporKematianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GetasanAppBar(),
      body: LaporKematianUserView(),
    );
  }
}
