import 'package:flutter/material.dart';

class KeyboardHelper {
  KeyboardHelper._();

  static close(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
