import 'package:flutter/widgets.dart';

class MyButtonController extends ChangeNotifier {
  bool? _isEnable;

  set enable(bool? value) {
    _isEnable = value;
    notifyListeners();
  }

  bool? get enable {
    return _isEnable;
  }
}
