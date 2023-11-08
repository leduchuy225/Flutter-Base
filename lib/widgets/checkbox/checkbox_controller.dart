import 'package:flutter/foundation.dart';

class MyCheckboxController extends ChangeNotifier {
  String? _title;
  bool? _isEnable;
  bool? _isSelected;

  set enable(bool? value) {
    _isEnable = value;
    notifyListeners();
  }

  bool? get enable {
    return _isEnable;
  }

  set title(String? value) {
    _title = value;
    notifyListeners();
  }

  String? get title {
    return _title;
  }

  set isSelected(bool? value) {
    _isSelected = value;
    notifyListeners();
  }

  bool? get isSelected {
    return _isSelected;
  }
}
