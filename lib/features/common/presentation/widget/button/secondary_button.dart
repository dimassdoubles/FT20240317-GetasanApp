import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  static const backgroundColor = AppColors.primary100;
  static const foregroundColor = AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        side: BorderSide(color: foregroundColor, width: 1.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.w),
        ),
        padding: EdgeInsets.all(12.w),
      ),
      child: Center(
        child: Text(
          label,
          style: AppTexts.semiBold.copyWith(
            color: foregroundColor,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
