import 'package:flutter_easyloading/flutter_easyloading.dart';

class StateDialogHelper {
  StateDialogHelper._();

  static showLoading() {
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static showError(
    String title,
    String body,
  ) {
    EasyLoading.showError(
      body,
      dismissOnTap: true,
    );
  }

  static showSuccess(
    String message,
  ) {
    EasyLoading.showSuccess(
      message,
      dismissOnTap: true,
    );
  }

  static dismiss() {
    EasyLoading.dismiss();
  }
}
