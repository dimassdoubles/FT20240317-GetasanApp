import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/setting/presentation/widgets/setting_header.dart';

class SettingTile extends ConsumerWidget {
  final IconData icon;
  final String label;
  const SettingTile({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SettingHeader.paddingSize),
      child: Row(
        children: [
          Container(
            width: SettingHeader.spaceIconWidth,
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 25.w,
            ),
          ),
          Gaps.h8,
          Expanded(
            child: Text(
              label,
              style: AppTexts.bold.copyWith(
                color: AppColors.primary,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
