import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';

class DropdownInput<ValueType> extends StatelessWidget {
  final String? hint;
  final List<DropdownMenuItem<ValueType>>? items;
  final void Function(ValueType? selected)? onChanged;
  final ValueType? value;
  const DropdownInput({
    super.key,
    this.hint,
    required this.items,
    this.value,
    required this.onChanged,
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
    return DropdownButtonFormField(
      value: value,
      style: valueStyle.copyWith(
        color: AppColors.primary,
      ),
      hint: Text(
        hint ?? '',
        style: AppTexts.interItalic.copyWith(
          color: AppColors.primary300,
          fontSize: 11.sp,
        ),
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.primary,
      ),
      validator: (value) {
        if (value == null) {
          return 'Silahkan masukan ${hint ?? 'inputan'} dulu';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18.w),
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(),
        disabledBorder: border(),
        errorBorder: border(
          color: AppColors.danger,
        ),
      ),
      items: items,
      onChanged: onChanged,
    );
  }
}
