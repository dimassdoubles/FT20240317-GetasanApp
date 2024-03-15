import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 56.h,
          width: 1.sw,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: const Divider(
            color: AppColors.primary200,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          color: AppColors.white,
          transform: Matrix4.translationValues(0, -1.h, 0),
          child: Text(
            'Atau',
            style: AppTexts.semiBold.copyWith(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}
