import 'package:get/get.dart';

import '../const/constants.dart';

class MyValidation {
  MyValidation._();

  static String? checkIsNotEmpty(String text) {
    if (text.isNotEmpty) {
      return null;
    }
    return MyStrings.noInput;
  }

  static String? checkIsPhoneNumber(String text) {
    final value = GetUtils.isPhoneNumber(text);
    if (value) {
      return null;
    }
    return 'Số điện thoại không đúng định dạng';
  }

  static String? checkIsEmail(String text) {
    final value = GetUtils.isEmail(text);
    if (value) {
      return null;
    }
    return 'Email không đúng định dạng';
  }

  static String? checkIsNumericOnly(String text) {
    final value = GetUtils.isNumericOnly(text);
    if (value) {
      return null;
    }
    return 'Chuỗi chứa ký tự không phải số';
  }
}
