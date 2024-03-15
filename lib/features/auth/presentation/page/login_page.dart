import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/secondary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(
              'Login',
              style: AppTexts.extraBold.copyWith(
                color: AppColors.primary,
                fontSize: 35,
                letterSpacing: 0.2.w,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(48.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextInput(
                      label: 'Email',
                    ),
                    Gaps.v16,
                    const TextInput(
                      label: 'Password',
                    ),
                    Gaps.v16,
                    Text(
                      'Lupa Password?',
                      style: AppTexts.extraBold.copyWith(
                        fontSize: 15,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(48.w),
            child: Column(
              children: [
                SecondaryButton(
                  label: 'Registrasi',
                  onTap: () {},
                ),
                Gaps.v24,
                PrimaryButton(
                  label: 'Login',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
