import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:get/get_utils/get_utils.dart';

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

class MyTextFieldController extends TextEditingController {
  var state = ValueNotifier(const MyTextFieldValue());

  late List<String? Function(String)>? validations;
  late void Function({List<String> errorTexts}) shake;

  MyTextFieldController();

  String get textTrim {
    return text.trim();
  }

  bool checkValidation() {
    final isValid = (validations ?? []).every((validation) {
      final errorText = validation(textTrim);
      if (errorText == null) {
        return true;
      }
      errorTexts = [errorText];
      return false;
    });
    if (isValid) {
      return true;
    }
    shake(errorTexts: errorTexts ?? []);
    return false;
  }

  bool get isEnable {
    return state.value.isEnable;
  }

  set isEnable(bool value) {
    state.value = state.value.copyWith(isEnable: value);
  }

  List<String>? get errorTexts {
    return state.value.errorTexts;
  }

  set errorTexts(List<String>? value) {
    state.value = state.value.copyWith(errorTexts: value);
  }
}

class MyTextFieldValue {
  final bool isEnable;
  final List<String>? errorTexts;

  const MyTextFieldValue({this.errorTexts, this.isEnable = true});

  MyTextFieldValue copyWith({
    bool? isEnable,
    bool? isValid,
    List<String>? errorTexts,
  }) {
    return MyTextFieldValue(
      isEnable: isEnable ?? this.isEnable,
      errorTexts: errorTexts ?? this.errorTexts,
    );
  }
}
