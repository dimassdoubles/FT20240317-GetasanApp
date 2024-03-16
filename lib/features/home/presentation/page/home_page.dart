import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/home/presentation/widget/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GetasanAppBar(
        action: Image.asset(
          'assets/icons/ic_hamburger.png',
        ),
      ),
      body: const HomeView(),
    );
  }
}
