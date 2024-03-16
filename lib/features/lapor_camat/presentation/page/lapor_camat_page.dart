import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/lapor_camat/presentation/widget/lapor_camat_user_view.dart';

class LaporCamatPage extends StatelessWidget {
  const LaporCamatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GetasanAppBar(),
      body: LaporCamatUserView(),
    );
  }
}
