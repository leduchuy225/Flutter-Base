import 'package:flutter/material.dart';

import 'radio_controller.dart';

class MyRadio<T> extends StatefulWidget {
  final T value;
  final String? title;
  final void Function(T?)? onChanged;
  final MyRadioController? controller;
  final ValueNotifier<T> groupValueNotifier;

  const MyRadio({
    Key? key,
    this.title,
    this.onChanged,
    this.controller,
    required this.value,
    required this.groupValueNotifier,
  }) : super(key: key);

  @override
  State<MyRadio> createState() => _MyRadioState<T>();
}

class _MyRadioState<T> extends State<MyRadio> {
  String? _title;

  MyRadioController get _mainController => widget.controller ?? MyRadioController();

  @override
  void initState() {
    super.initState();

    _mainController.title ??= widget.title;
    _title = _mainController.title;

    _mainController.addListener(() {
      if (_title != _mainController.title) {
        setState(() {
          _title = _mainController.title;
        });
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
    return ValueListenableBuilder(
      valueListenable: widget.groupValueNotifier,
      builder: (context, value, child) {
        return RadioListTile<T>(
          groupValue: value,
          value: widget.value,
          title: Text(_title ?? ''),
          onChanged: widget.onChanged,
        );
      },
    );
  }
}
