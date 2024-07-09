import 'package:get/get.dart';

import '../../../app_pkg.dart';

class ValidateCheck{
  ValidateCheck._();

  static String? validateEmail(String? value,) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final kEmailValid = RegExp(pattern);
    bool isValid = kEmailValid.hasMatch(value.toString());
    if (value?.isEmpty??true) {
      return AppTranslations.emailIsRequired.tr;
    } else if (isValid == false) {
      return AppTranslations.invalidEmail.tr;
    }
    return null;
  }


  static String? validateUrl(String? value) {
    String? pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty??true) {
      return 'Please enter url';
    }
    else if (!regExp.hasMatch(value??"")) {
      return 'Please enter valid url';
    }
    return null;
  }


  static String? validateEmptyText(String? value, String? message) {
    if (value == null || value.isEmpty) {
      return message?.tr;
    }
    return null;
  }

  static String? validatePassword(String? value, [String? message]) {
    if (value == null || value.isEmpty) {
      return message??AppTranslations.passwordIsRequired.tr;
    }
    return null;
  }
  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return AppTranslations.conPassIsRequired.tr;
    }else if(value != password){
      return AppTranslations.conPassDoesMatch.tr;
    }
    return null;
  }

  static String? validateConfirmEmail(String? value, String? email) {
    if (value == null || value.isEmpty) {
      return AppTranslations.conEmailIsRequired.tr;
    }else if(value != email){
      return AppTranslations.conEmailDoesMatch.tr;
    }
    return null;
  }
}