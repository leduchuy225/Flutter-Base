import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';

import '../animate/animate_controller.dart';
import '../animate/animate_widget.dart';

class MyTextField extends StatefulWidget {
  final bool? enable;
  final String? labelText;
  final MyTextFieldController? controller;

  const MyTextField({super.key, this.controller, this.labelText, this.enable});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String? _errorTextState;
  late bool? _isEnableState;

  final _animateController = MyAnimateController();

  MyTextFieldController? get controller => widget.controller;

  bool? get enable => controller?.enable ?? widget.enable;

  void shake({List<String>? errorTexts}) {
    setState(() {
      _animateController.animate();
      _errorTextState = getErrorText(errorTexts);
    });
  }

  @override
  void initState() {
    super.initState();
    _isEnableState = enable;
    controller?.shake = shake;
    controller?.addListener(() {
      setState(() {
        _isEnableState = enable;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyAnimateWidget(
      controller: _animateController,
      effects: const [ShakeEffect()],
      child: TextFormField(
        enabled: _isEnableState,
        controller: controller,
        decoration: InputDecoration(
          errorText: _errorTextState,
          labelText: widget.labelText,
        ),
      ),
    );
  }
}

String getErrorText(List<String>? errorTexts) {
  return (errorTexts ?? []).reduce((value, element) => '$value\n$element');
}
