import 'package:flutter/material.dart';

class MyTextFieldController extends TextEditingController {
  var state = ValueNotifier(const MyTextFieldValue());

  late void Function({List<String> errorTexts}) shake;

  MyTextFieldController();

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
