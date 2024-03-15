import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';

class DateInput extends StatelessWidget {
  const DateInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextInput(
      hint: 'dd/MM/yyyy (waktu)',
      suffixIcon: InkWell(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(14.w),
          bottomRight: Radius.circular(14.w),
        ),
        onTap: () {
          // TODO date and time picker
        },
        child: Image.asset(
          'assets/icons/ic_calendar.png',
        ),
      ),
    );
  }
}
