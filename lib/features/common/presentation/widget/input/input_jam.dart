import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getasan_app/features/common/helper/date_time_helper.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';

class InputJam extends HookWidget {
  final String? hint;
  final void Function(TimeOfDay timeSelected)? onTimeSelected;
  const InputJam({
    super.key,
    this.hint,
    this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final useTime = useState(TimeOfDay.now());
    final useTimeCtrl = useTextEditingController(
      text: DateTimeHelper.displasyTime(useTime.value),
    );

    return TextInput(
      onTap: () async {
        final timeSelected = await showTimePicker(
          context: context,
          initialTime: useTime.value,
        );

        if (timeSelected != null) {
          useTime.value = timeSelected;
          useTimeCtrl.text = DateTimeHelper.displasyTime(timeSelected);
        }

        onTimeSelected?.call(useTime.value);
      },
      controller: useTimeCtrl,
      hint: hint,
      readOnly: true,
    );
  }
}
