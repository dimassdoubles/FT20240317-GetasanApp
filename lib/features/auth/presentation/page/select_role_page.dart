import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/auth/presentation/page/confirmation_role_page.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/or_divider.dart';
import 'package:getasan_app/features/splash/presentation/page/splash_screen.dart';

class SelectRolePage extends StatelessWidget {
  const SelectRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
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
                  'Silahkan Pilih',
                  style: AppTexts.medium.copyWith(
                    color: AppColors.primary,
                    fontSize: 19.sp,
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
                    label: 'Masuk Sebagai Admin',
                    backgroundColor: AppColors.secondary,
                    onTap: () {
                      debugPrint('Hello masuk sebagai admin');
                      _selectRole(context);
                    },
                  ),
                  Gaps.v12,
                  const OrDivider(),
                  Gaps.v12,
                  PrimaryButton(
                    label: 'Masuk Sebagai User',
                    backgroundColor: AppColors.secondary,
                    onTap: () {
                      debugPrint('Hello masuk sebagai user');
                      _selectRole(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectRole(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ConfirmationRolePage(),
      ),
    );
  }
}
