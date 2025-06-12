import 'package:flutter/material.dart';

class MyTextFieldController extends TextEditingController {
  bool? _isEnable;
  List<String>? _errorTexts;

  late void Function({List<String> errorTexts}) shake;

  MyTextFieldController({isEnable}) {
    _isEnable = isEnable;
  }

  List<String>? get errorTexts {
    return _errorTexts;
  }

  set errorTexts(List<String>? errors) {
    _errorTexts = errors;
    notifyListeners();
  }

  bool get enable {
    return _isEnable ?? true;
  }

  set enable(bool enable) {
    _isEnable = enable;
    notifyListeners();
  }
}
