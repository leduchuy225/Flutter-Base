import 'package:flutter/material.dart';

import 'checkbox_controller.dart';

class MyCheckbox extends StatefulWidget {
  final bool? value;
  final String? title;
  final void Function(bool?) onChanged;
  final MyCheckboxController? controller;

  const MyCheckbox({Key? key, this.value, required this.onChanged, this.title, this.controller}) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  late bool? _isSelected;
  late MyCheckboxController controller;

  MyCheckboxController get mainController => widget.controller ?? controller;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      controller = MyCheckboxController();
    }
    mainController.title ??= widget.title;
    mainController.isSelected ??= widget.value;

    _isSelected = mainController.isSelected;

    mainController.addListener(() {
      print('Listener');
      if (_isSelected != mainController.isSelected) {
        setState(() {
          _isSelected = mainController.isSelected;
        });
        widget.onChanged(_isSelected);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    mainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _isSelected,
      enabled: mainController.enable,
      title: Text(mainController.title ?? ''),
      onChanged: (value) {
        mainController.isSelected = value;
      },
    );
  }
}
