import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Widget? suffixIcon;
  const TextInput({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.suffixIcon,
  });

  static border({Color color = AppColors.primary}) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(14.w),
      );

  static final valueStyle = AppTexts.regular.copyWith(fontSize: 11.sp);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: AppTexts.bold.copyWith(
              color: AppColors.primary,
              fontSize: 14.sp,
            ),
          ),
        Gaps.v4,
        TextFormField(
          controller: controller,
          style: valueStyle,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.all(18.w),
            hintText: hint,
            hintStyle: AppTexts.interItalic.copyWith(
              color: AppColors.primary300,
              fontSize: 11.sp,
            ),
            border: border(),
            enabledBorder: border(),
            focusedBorder: border(),
            disabledBorder: border(),
            errorBorder: border(
              color: AppColors.danger,
            ),
          ),
        ),
      ],
    );
  }
}
