import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:get/get.dart';

import 'button_controller.dart';

class MyButton extends StatefulWidget {
  final ButtonStyleButton buttonChild;
  final MyButtonController? controller;

  const MyButton({super.key, required this.buttonChild, this.controller});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  late final MyButtonController _controller;

  MyButtonController get _mainController => widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _controller = MyButtonController();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _mainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.buttonChild is! ElevatedButton &&
        widget.buttonChild is! OutlinedButton) {
      return const SizedBox.shrink();
    }
    return Obx(() {
      if (_mainController.isEnable.value == false) {
        return ElevatedButton(
          onPressed: null,
          child: widget.buttonChild.child,
          style: widget.buttonChild.style?.copyWith(
            backgroundColor: WidgetStateProperty.all<Color>(AppColors.muted),
          ),
        );
      }
      return widget.buttonChild;
    });
  }
}
