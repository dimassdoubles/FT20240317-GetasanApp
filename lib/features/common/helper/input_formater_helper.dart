import 'package:flutter/services.dart';

class InputFormatterHelper {
  InputFormatterHelper._();

  static final forEmail = [
    FilteringTextInputFormatter.deny(RegExp(r'[^a-zA-Z0-9@._]')),
  ];
}
