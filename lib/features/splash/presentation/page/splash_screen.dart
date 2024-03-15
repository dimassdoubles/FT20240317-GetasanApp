import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/auth/presentation/page/select_role_page.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const splashIconHeroTag = 'icon_splash';

  @override
  Widget build(BuildContext context) {
    _goToTheNextPage(context);

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

  void _goToTheNextPage(BuildContext context) async {
    debugPrint("Hello Go to next page");
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SelectRolePage(),
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
