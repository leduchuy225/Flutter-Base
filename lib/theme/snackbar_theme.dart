import 'package:flutter/material.dart';

import '../widgets/dialog/dialog_widget.dart';

extension SnackbarTypeExtension on SnackbarType {
  List<Color> get colors {
    switch (this) {
      case SnackbarType.ERROR:
        return [Colors.red, Colors.white];
      case SnackbarType.INFORMATION:
        return [Colors.blue, Colors.white];
      case SnackbarType.WARNING:
        return [Colors.yellow, Colors.white];
      case SnackbarType.SUCCESS:
        return [Colors.green, Colors.white];
      default:
        return [Colors.blue, Colors.white];
    }
  }
}
