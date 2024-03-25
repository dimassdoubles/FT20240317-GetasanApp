import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:getasan_app/features/auth/presentation/page/login_page.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/home/presentation/page/home_page.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  static const splashIconHeroTag = 'icon_splash';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider);
    authController.checkLogin(onCheckDone: () async {
      await Future.delayed(const Duration(seconds: 2));
      final currentUser = ref.read(authController.currentUserProvider);
      // ignore: use_build_context_synchronously
      _goToTheNextPage(context, isLoggedin: currentUser != null);
    });

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Hero(
          tag: splashIconHeroTag,
          child: Image.asset(
            'assets/logos/logo_fill_text.png',
            color: AppColors.white,
            width: 0.4.sw,
          ),
        ),
      ),
    );
  }

  void _goToTheNextPage(BuildContext context, {required bool isLoggedin}) {
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) =>
            isLoggedin ? const HomePage() : const LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
