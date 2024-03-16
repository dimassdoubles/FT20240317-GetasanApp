import 'package:flutter_easyloading/flutter_easyloading.dart';

void configStateDialog() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.light;
}
