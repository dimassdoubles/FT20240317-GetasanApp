import 'package:flutter_easyloading/flutter_easyloading.dart';

class StateDialogHelper {
  StateDialogHelper._();

  static showLoading() {
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static dismiss() {
    EasyLoading.dismiss();
  }
}
