import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/secondary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';

class RegistrasiPage extends StatelessWidget {
  const RegistrasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'Registrasi',
                style: AppTexts.extraBold.copyWith(
                  color: AppColors.primary,
                  fontSize: 35,
                  letterSpacing: 0.2.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(48.w),
              child: Column(
                children: [
                  const TextInput(
                    label: 'Nama Lengkap',
                  ),
                  Gaps.v16,
                  const TextInput(
                    label: 'Email',
                  ),
                  Gaps.v16,
                  const TextInput(
                    label: 'Password',
                  ),
                  Gaps.v16,
                  const TextInput(
                    label: 'Password',
                  ),
                  Gaps.v16,
                  const TextInput(
                    label: 'Verifikasi Password',
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  PrimaryButton(
                    label: 'Registrasi',
                    onTap: () {},
                  ),
                  Gaps.v24,
                  SecondaryButton(
                    label: 'Login',
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
