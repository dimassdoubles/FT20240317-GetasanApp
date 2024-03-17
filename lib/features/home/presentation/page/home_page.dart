import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/home/presentation/widget/home_view.dart';
import 'package:getasan_app/features/setting/presentation/page/setting_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetasanAppBar(
        action: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingPage(),
              ),
            );
          },
          child: Image.asset(
            'assets/icons/ic_action.png',
            height: 27.w,
          ),
        ),
      ),
      body: const HomeView(),
    );
  }
}
