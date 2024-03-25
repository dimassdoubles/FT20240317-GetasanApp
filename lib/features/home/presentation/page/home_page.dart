import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:getasan_app/features/auth/presentation/page/login_page.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/home/presentation/widget/home_view.dart';
import 'package:getasan_app/features/setting/presentation/page/setting_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider);
    ref.listen(
      authController.currentUserProvider,
      (previous, next) {
        if (next == null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
            (route) => false,
          );
        }
      },
    );

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
