import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/secondary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/input/date_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/image_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              label: 'Primary Button',
              onTap: () {},
            ),
            Gaps.v16,
            PrimaryButton(
              label: 'Primary Button',
              backgroundColor: AppColors.secondary,
              onTap: () {},
            ),
            Gaps.v16,
            SecondaryButton(
              label: 'Secondary Button',
              onTap: () {},
            ),
            Gaps.v16,
            const TextInput(
              label: 'Nama Lengkap',
            ),
            Gaps.v16,
            const TextInput(
              hint: 'Nama Kegiatan',
            ),
            Gaps.v16,
            const DateInput(),
            Gaps.v16,
            const ImageInput(),
          ],
        ),
      ),
    );
  }
}
