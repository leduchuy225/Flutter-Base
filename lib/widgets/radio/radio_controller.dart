import 'package:flutter/foundation.dart';

class MyRadioController extends ChangeNotifier {
  String? _title;

  String? get title => _title;

  set title(String? value) {
    _title = value;
    notifyListeners();
  }
}
