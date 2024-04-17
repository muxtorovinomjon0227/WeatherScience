import 'package:easy_localization/easy_localization.dart';

String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);
  return value!.isEmpty || !regex.hasMatch(value)
      ? 'authView.inputEmail'.tr()
      : null;
}

String? validatePassword(String? password) {
  String errorMessage = '';
  errorMessage = '';
  if (password!.length <6) {
    errorMessage += 'authView.passLang'.tr();
  }
  if (!password.contains(RegExp(r'[A-Z]'))) {
    errorMessage += 'authView.uppercase'.tr();
  }
  if (!password.contains(RegExp(r'[a-z]'))) {
    errorMessage += 'authView.lowercase'.tr();
  }
  if (!password.contains(RegExp(r'[0-9]'))) {
    errorMessage += 'authView.number'.tr();
  }
  if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
    errorMessage += 'authView.character'.tr();
  }
  return errorMessage.isEmpty ? null : errorMessage;
}

