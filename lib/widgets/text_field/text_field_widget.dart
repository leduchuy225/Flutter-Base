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
  String? _errorTextState;
  late bool? _isEnableState;

  final _animateController = MyAnimateController();

  MyTextFieldController? get controller => widget.controller;

  List<String>? get errorTexts => controller?.errorTexts;
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
        _errorTextState = getErrorText(errorTexts);
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
        onTap: widget.onTap,
        controller: controller,
        enabled: _isEnableState,
        readOnly: widget.readOnly,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: _errorTextState,
          suffixIcon: widget.suffixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: '${widget.labelText} ${widget.isRequired ? ' *' : ''}',
          hintStyle: AppTextStyles.caption.copyWith(color: AppColors.textGrey2),
        ),
      ),
    );
  }
}

String getErrorText(List<String>? errorTexts) {
  return (errorTexts ?? []).reduce((value, element) => '$value\n$element');
}
