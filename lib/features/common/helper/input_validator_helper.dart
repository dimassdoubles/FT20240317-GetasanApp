class InputValidatorHelper {
  InputValidatorHelper._();

  static String? formEmail(String value, {String? errorMessage}) {
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return errorMessage ?? 'Maaf, email tidak valid';
    }

    return null;
  }
}
