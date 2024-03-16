import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';

class AppCard extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback? onTap;
  const AppCard({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.w),
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3.h),
              spreadRadius: 1,
              blurRadius: 4,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Hero(
                tag: 'titleCard:$title',
                child: Text(
                  title,
                  style: AppTexts.extraBold.copyWith(
                    color: AppColors.primary,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            Gaps.h12,
            Hero(
              tag: 'iconCard:$icon',
              child: Image.asset(icon),
            ),
          ],
        ),
      ),
    );
  }
}
