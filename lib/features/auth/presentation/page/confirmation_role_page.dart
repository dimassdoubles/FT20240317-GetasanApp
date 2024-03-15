import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/auth/presentation/page/sugeng_rawuh_page.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/splash/presentation/page/splash_screen.dart';

class ConfirmationRolePage extends StatelessWidget {
  const ConfirmationRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Hero(
                tag: SplashScreen.splashIconHeroTag,
                child: Image.asset(
                  'assets/logos/logo_fill_text.png',
                  color: AppColors.primary,
                  width: 0.4.sw,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Anda Akan Lanjut Sebagai',
                      style: AppTexts.medium.copyWith(
                        color: AppColors.primary,
                        fontSize: 19.sp,
                        letterSpacing: 0.2.w,
                      ),
                    ),
                    Text(
                      'User',
                      style: AppTexts.semiBold.copyWith(
                        color: AppColors.primary,
                        fontSize: 19.sp,
                        letterSpacing: 0.2.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(48.w),
              child: PrimaryButton(
                label: 'Lanjut',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SugengRawuhPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
