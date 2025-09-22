import 'package:flutter/material.dart';

class MyTextFieldController extends TextEditingController {
  var state = ValueNotifier(const MyTextFieldValue());

  List<String? Function(String)>? validations;
  void Function({List<String> errorTexts})? _shake;

  MyTextFieldController();

  String get textTrim {
    return text.trim();
  }

  void shakeWithErrors({List<String>? errors}) {
    if (_shake == null) {
      return;
    }
    _shake!(errorTexts: errors ?? []);
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
    shakeWithErrors(errors: errorTexts);
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

  set shake(void Function({List<String> errorTexts})? shakeFunction) {
    _shake = shakeFunction;
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
