import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';

import '../../theme/styles.dart';
import '../animate/animate_controller.dart';
import '../animate/animate_widget.dart';

class MyTextField extends StatefulWidget {
  final bool? enable;
  final bool readOnly;
  final bool isRequired;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final MyTextFieldController? controller;
  final void Function(String)? onChanged;

  const MyTextField({
    super.key,
    this.onTap,
    this.enable,
    this.hintText,
    this.labelText,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.isRequired = false,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late final MyTextFieldController _controller;

  final _animateController = MyAnimateController();

  MyTextFieldController get _mainController => widget.controller ?? _controller;

  bool? get enable => _mainController.isEnable;
  List<String>? get errorTexts => _mainController.errorTexts;

  void shake({List<String>? errorTexts}) {
    _animateController.animate();
    _mainController.errorTexts = errorTexts;
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = MyTextFieldController();
    }
    _mainController.shake = shake;
  }

  @override
  void dispose() {
    super.dispose();
    _mainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _mainController.state,
      builder: (context, value, child) {
        return MyAnimateWidget(
          controller: _animateController,
          effects: const [ShakeEffect()],
          child: TextFormField(
            onTap: widget.onTap,
            enabled: value.isEnable,
            readOnly: widget.readOnly,
            controller: _mainController,
            onChanged: widget.onChanged,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon,
              errorText: getErrorText(value.errorTexts),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: '${widget.labelText} ${widget.isRequired ? ' *' : ''}',
              hintStyle: AppTextStyles.caption.copyWith(
                color: AppColors.textGrey2,
              ),
            ),
          ),
        );
      },
    );
  }
}

String? getErrorText(List<String>? errorTexts) {
  if (errorTexts == null) {
    return null;
  }
  return errorTexts.reduce((value, element) => '$value\n$element');
}
