import 'package:flutter/material.dart';

class MyTextFieldController extends TextEditingController {
  bool? _isEnable;

  late void Function({List<String> errorTexts}) shake;

  MyTextFieldController({isEnable}) {
    _isEnable = isEnable;
  }

  bool get enable {
    return _isEnable ?? true;
  }

  set enable(bool enable) {
    _isEnable = enable;
    notifyListeners();
  }
}
