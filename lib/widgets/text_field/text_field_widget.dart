import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';

import '../../theme/styles.dart';
import '../animate/animate_controller.dart';
import '../animate/animate_widget.dart';

class MyTextField extends StatefulWidget {
  final bool readOnly;
  final int? maxLines;
  final bool isRequired;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextAlign textAlign;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final MyTextFieldController? controller;
  final List<String? Function(String)>? validations;

  const MyTextField({
    super.key,
    this.onTap,
    this.hintText,
    this.labelText,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.isRequired = false,
    this.obscureText = false,
    this.onChanged,
    this.maxLines,
    this.prefixIcon,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.validations,
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
    _mainController.validations = widget.validations;
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
            textAlign: widget.textAlign,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            onChanged: (value) {
              final isValid = (widget.validations ?? []).every((validation) {
                final errorText = validation(_mainController.textTrim);
                if (errorText == null) {
                  return true;
                }
                _mainController.errorTexts = [errorText];
                return false;
              });

              if (isValid) {
                _mainController.errorTexts?.clear();
              }

              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              errorText: getErrorText(value.errorTexts),
              hintText: widget.hintText ?? widget.labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: AppTextStyles.body2.copyWith(
                color: AppColors.textGrey2,
              ),
              label: widget.labelText != null
                  ? RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(text: '${widget.labelText}'),
                          if (widget.isRequired)
                            TextSpan(
                              text: ' * ',
                              style: AppTextStyles.title1.copyWith(
                                color: AppColors.error,
                              ),
                            ),
                        ],
                      ),
                    )
                  : null,
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
  if (errorTexts.isEmpty) {
    return null;
  }
  return errorTexts.reduce((value, element) => '$value\n$element');
}
