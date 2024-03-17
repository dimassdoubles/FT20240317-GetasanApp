import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';

class SettingHeader extends ConsumerWidget {
  const SettingHeader({super.key});

  static final spaceIconWidth = 56.w;
  static final paddingSize = AppSize.pagePadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingSize, vertical: 16.w),
      child: Row(
        children: [
          Container(
            width: spaceIconWidth,
            alignment: Alignment.center,
            child: Image.asset('assets/icons/ic_user_pict.png', width: 48.w),
          ),
          Gaps.h8,
          Text(
            'Salma Shafira',
            style: AppTexts.bold.copyWith(
              color: AppColors.primary,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
