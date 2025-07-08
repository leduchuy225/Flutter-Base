import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:get/get_utils/get_utils.dart';

class MyTextFieldController extends TextEditingController {
  var state = ValueNotifier(const MyTextFieldValue());

  late void Function({List<String> errorTexts}) shake;

  MyTextFieldController();

  String get textTrim {
    return text.trim();
  }

  bool checkIsNotEmpty() {
    if (textTrim.isNotEmpty) {
      return true;
    }
    shake(errorTexts: [MyStrings.noInput]);
    return false;
  }

  bool checkIsPhoneNumber() {
    final value = GetUtils.isPhoneNumber(textTrim);
    if (value) {
      return true;
    }
    shake(errorTexts: ['Số điện thoại không đúng định dạng']);
    return false;
  }

  bool checkIsEmail() {
    final value = GetUtils.isEmail(textTrim);
    if (value) {
      return true;
    }
    shake(errorTexts: ['Email không đúng định dạng']);
    return false;
  }

  bool checkIsNumericOnly() {
    final value = GetUtils.isNumericOnly(textTrim);
    if (value) {
      return true;
    }
    shake(errorTexts: ['Chuỗi chứa ký tự không phải số']);
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

  MyTextFieldValue copyWith({bool? isEnable, List<String>? errorTexts}) {
    return MyTextFieldValue(
      isEnable: isEnable ?? this.isEnable,
      errorTexts: errorTexts ?? this.errorTexts,
    );
  }
}
