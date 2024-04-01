import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/helper/date_time_helper.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';

class DateInput extends HookWidget {
  final String? hint;
  final void Function(DateTime dateSelected)? onDateSelected;
  const DateInput({
    super.key,
    this.hint,
    this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final useDate = useState(DateTime.now());
    final useDateCtrl = useTextEditingController(
      text: "${DateTimeHelper.displayDate(useDate.value)} $hint",
    );

    return TextInput(
      controller: useDateCtrl,
      hint: 'dd/MM/yyyy ${hint ?? ""}',
      readOnly: true,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(14.w),
          bottomRight: Radius.circular(14.w),
        ),
        onTap: () async {
          final dateSelected = await showDatePicker(
            context: context,
            firstDate: DateTime(2020),
            currentDate: useDate.value,
            lastDate: DateTime.now(),
          );

          if (dateSelected != null) {
            useDate.value = dateSelected;
            useDateCtrl.text =
                "${DateTimeHelper.displayDate(useDate.value)} $hint";
            onDateSelected?.call(dateSelected);
          } else {
            onDateSelected?.call(useDate.value);
          }
        },
        child: Image.asset(
          'assets/icons/ic_calendar.png',
        ),
      ),
    );
  }
}
