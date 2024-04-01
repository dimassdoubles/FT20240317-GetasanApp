import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final Widget? suffixIcon;
  final int? minLines;
  final int? maxLines;
  final bool obsecureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool isRequired;
  final String?
      name; // teks yang akan ditampilkan di error '{name} tidak boleh kosong'
  final String? Function(String? value)? validator;
  final bool readOnly;
  final void Function()? onTap;
  const TextInput({
    super.key,
    this.readOnly = false,
    this.controller,
    this.label,
    this.hint,
    this.suffixIcon,
    this.minLines,
    this.maxLines,
    this.obsecureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.isRequired = true,
    this.name,
    this.validator,
    this.onTap,
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
          onTap: onTap,
          controller: controller,
          readOnly: readOnly,
          style: valueStyle,
          minLines: minLines,
          maxLines: maxLines,
          obscureText: obsecureText,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          validator: (value) {
            if (isRequired) {
              if (value!.isEmpty) {
                return 'Silahkan masukan ${name ?? label ?? 'inputan'} dulu';
              }
            }

            return validator?.call(value);
          },
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
