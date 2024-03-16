import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';

class AppBackButton extends StatelessWidget {
  final BuildContext context;
  const AppBackButton(
    this.context, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 4.w,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/ic_back.png',
              width: 21.w,
            ),
            Gaps.h8,
            Text(
              'Kembali',
              style: AppTexts.bold.copyWith(
                color: AppColors.secondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
