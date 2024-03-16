import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';

class InputDataIbuPage extends StatelessWidget {
  const InputDataIbuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(context),
              Gaps.v36,
              Text(
                'Data Ibu',
                style: AppTexts.extraBold.copyWith(
                  fontSize: 19,
                  color: AppColors.primary,
                ),
              ),
              Gaps.v16,
              const TextInput(hint: 'Nama Ibu'),
              Gaps.v16,
              const TextInput(hint: 'Pekerjaan'),
              Gaps.v16,
              const TextInput(hint: 'Alamat Rumah'),
              Gaps.v16,
              const TextInput(hint: 'NIK'),
              Gaps.v16,
              const TextInput(hint: 'No HP'),
              Gaps.v16,
              const TextInput(hint: 'Email'),
              Gaps.v36,
              PrimaryButton(
                label: 'Berikutnya',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
