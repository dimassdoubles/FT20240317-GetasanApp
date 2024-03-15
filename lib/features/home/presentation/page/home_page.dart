import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/home/presentation/widget/app_bottom_navbar.dart';
import 'package:getasan_app/features/home/presentation/widget/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const AppBottomNavbar(),
      // ignore: prefer_const_constructors
      body: HomeView(),
    );
  }
}
