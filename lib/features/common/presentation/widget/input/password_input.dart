import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';

class PasswordInput extends ConsumerStatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  const PasswordInput({
    super.key,
    this.controller,
    this.label,
    this.hint,
  });

  @override
  ConsumerState<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends ConsumerState<PasswordInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextInput(
      controller: widget.controller,
      label: widget.label,
      hint: widget.hint,
      obsecureText: isHidden,
      maxLines: 1,
      suffixIcon: InkWell(
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(14.w),
          bottomRight: Radius.circular(14.w),
        ),
        child: Icon(
          isHidden ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
