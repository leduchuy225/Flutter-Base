import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'radio_controller.dart';

class MyRadio<T> extends StatefulWidget {
  final T value;
  final String title;
  final void Function(T?)? onChanged;
  final MyRadioController? controller;
  final ValueNotifier<T> groupValueNotifier;

  const MyRadio({
    Key? key,
    this.onChanged,
    this.controller,
    this.title = '',
    required this.value,
    required this.groupValueNotifier,
  }) : super(key: key);

  @override
  State<MyRadio> createState() => _MyRadioState<T>();
}

class _MyRadioState<T> extends State<MyRadio> {
  late final MyRadioController _controller;

  MyRadioController get _mainController => widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _controller = MyRadioController();
    }

    _mainController.title.value = widget.title;
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
        return Obx(() {
          return RadioListTile<T>(
            groupValue: value,
            value: widget.value,
            onChanged: widget.onChanged,
            title: Text(_mainController.title.value),
          );
        });
      },
    );
  }
}
