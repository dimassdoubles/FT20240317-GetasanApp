import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/button/secondary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/or_divider.dart';

class ImageInput extends StatelessWidget {
  const ImageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FileImagePicker(),
        OrDivider(),
        OutlinedButton(
          onPressed: () {
            // TODO camera image picker
          },
          style: OutlinedButton.styleFrom(
            elevation: 0,
            backgroundColor: SecondaryButton.backgroundColor,
            foregroundColor: SecondaryButton.foregroundColor,
            side:
                BorderSide(color: SecondaryButton.foregroundColor, width: 1.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.w),
            ),
            padding: EdgeInsets.all(12.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/ic_camera.png'),
              Gaps.h12,
              Text(
                'Buka kamera & ambil foto',
                style: AppTexts.semiBold.copyWith(
                  color: SecondaryButton.foregroundColor,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FileImagePicker extends StatelessWidget {
  const _FileImagePicker();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // TODO image picker from file
      },
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(24.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            14.w,
          ),
        ),
        side: BorderSide(
          width: 1.w,
          color: AppColors.primary,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/icons/ic_image.png'),
            Gaps.v12,
            Text(
              'Pilih File',
              style: AppTexts.bold.copyWith(
                color: AppColors.primary,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
