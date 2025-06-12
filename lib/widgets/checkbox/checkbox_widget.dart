import 'package:flutter/material.dart';

import 'checkbox_controller.dart';

class MyCheckbox extends StatefulWidget {
  final bool? value;
  final String? title;
  final void Function(bool?) onChanged;
  final MyCheckboxController? controller;

  const MyCheckbox({
    Key? key,
    this.value,
    required this.onChanged,
    this.title,
    this.controller,
  }) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  late bool? _value;
  final _controller = MyCheckboxController();

  MyCheckboxController get _mainController => widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();

    _mainController.title ??= widget.title;
    _mainController.value ??= widget.value;

    _value = _mainController.value;

    _mainController.addListener(() {
      print('Listener');
      if (_value != _mainController.value) {
        setState(() {
          _value = _mainController.value;
        });
        widget.onChanged(_value);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _mainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _value,
      enabled: _mainController.enable,
      title: Text(_mainController.title ?? ''),
      onChanged: (value) {
        _mainController.value = value;
      },
    );
  }
}
