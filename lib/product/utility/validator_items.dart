import 'package:kartal/kartal.dart';

class ValidatorItems {
  const ValidatorItems._();

  static String? validateEmail(String? text) {
    return text?.ext.isValidEmail == true
        ? null
        : "Lütfen geçerli bir email giriniz";
  }

  static String? validatePassword(String? password) {
    return (password?.length ?? 0) >= 6
        ? null
        : "Şifre en az 6 karakter olmalıdır";
  }
}
