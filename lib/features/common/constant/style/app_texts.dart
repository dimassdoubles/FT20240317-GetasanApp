import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTexts {
  AppTexts._();

  static final _baseText = GoogleFonts.nunitoSans();

  static final regular = _baseText.copyWith(
    height: 1.2,
  );

  static final medium = _baseText.copyWith(
    height: 1.2,
    fontWeight: FontWeight.w500,
  );

  static final semiBold = _baseText.copyWith(
    height: 1.74,
    fontWeight: FontWeight.w600,
  );

  static final bold = _baseText.copyWith(
    height: 1.2,
    fontWeight: FontWeight.w700,
  );

  static final extraBold = _baseText.copyWith(
    height: 1.2,
    fontWeight: FontWeight.w800,
  );

  static final _inter = GoogleFonts.inter();
  static final interItalic = _inter.copyWith(
    height: 1.2,
    fontStyle: FontStyle.italic,
  );
}
