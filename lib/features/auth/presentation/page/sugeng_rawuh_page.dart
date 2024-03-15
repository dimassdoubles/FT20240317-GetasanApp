import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/auth/presentation/page/registrasi_page.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/secondary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/or_divider.dart';
import 'package:getasan_app/features/splash/presentation/page/splash_screen.dart';

class SugengRawuhPage extends StatelessWidget {
  const SugengRawuhPage({super.key});

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
                child: Text(
                  'Sugeng Rawuh!',
                  style: AppTexts.extraBold.copyWith(
                    color: AppColors.primary,
                    fontSize: 35.sp,
                    letterSpacing: 0.2.w,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(48.w),
              child: Column(
                children: [
                  PrimaryButton(
                    label: 'Registrasi',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegistrasiPage(),
                        ),
                      );
                    },
                  ),
                  Gaps.v12,
                  const OrDivider(),
                  Gaps.v12,
                  SecondaryButton(
                    label: 'Login',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
