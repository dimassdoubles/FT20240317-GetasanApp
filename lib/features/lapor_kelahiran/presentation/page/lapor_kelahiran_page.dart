import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/lapor_kelahiran/presentation/widget/lapor_kelahiran_user_view.dart';

class LaporKelahiranPage extends StatelessWidget {
  const LaporKelahiranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GetasanAppBar(),
      body: LaporKelahiranUserView(),
    );
  }
}
