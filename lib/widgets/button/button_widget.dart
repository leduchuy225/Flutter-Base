import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';

import 'button_controller.dart';

class MyButton extends StatefulWidget {
  final ButtonStyleButton buttonChild;
  final MyButtonController? controller;

  const MyButton({super.key, required this.buttonChild, this.controller});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool? _isEnable;

  final _controller = MyButtonController();

  MyButtonController get _mainController => widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();

    _isEnable = _mainController.enable;
    _mainController.addListener(() {
      setState(() {
        _isEnable = _mainController.enable;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _mainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isEnable == false) {
      return ElevatedButton(
        onPressed: null,
        child: widget.buttonChild.child,
        style: widget.buttonChild.style?.copyWith(
          backgroundColor: WidgetStateProperty.all<Color>(AppColors.muted),
        ),
      );
    }
    return widget.buttonChild;
  }
}
