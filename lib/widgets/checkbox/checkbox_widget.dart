import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'checkbox_controller.dart';

class MyCheckbox extends StatefulWidget {
  final String title;
  final bool isSelected;
  final void Function(bool?)? onChanged;
  final MyCheckboxController? controller;
  final ListTileControlAffinity controlAffinity;

  const MyCheckbox({
    Key? key,
    this.controller,
    this.title = '',
    this.onChanged,
    this.isSelected = false,
    this.controlAffinity = ListTileControlAffinity.leading,
  }) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  late final MyCheckboxController _controller;

  MyCheckboxController get _mainController => widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _controller = MyCheckboxController();
    }

    _mainController.title.value = widget.title;
    _mainController.isSelected.value = widget.isSelected;
  }

  @override
  void dispose() {
    super.dispose();
    _mainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        controlAffinity: widget.controlAffinity,
        value: _mainController.isSelected.value,
        enabled: _mainController.isEnable.value,
        title: Text(_mainController.title.value),
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
          _mainController.isSelected.value = value;
        },
      );
    });
  }
}
