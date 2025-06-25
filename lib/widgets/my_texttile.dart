import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';

enum MyTexttileOrientation { VERTICAL, HORIZONTAL }

class MyTexttileItem {
  final String? text;
  final String titleText;

  MyTexttileItem({this.text, required this.titleText});
}

class MyTexttile extends StatelessWidget {
  const MyTexttile({
    Key? key,
    this.text,
    this.maxLines,
    this.textStyle,
    this.labelStyle,
    this.textFlex = 5,
    this.labelFlex = 2,
    this.hasDivider = true,
    required this.titleText,
    this.isHideIfTextNull = false,
    this.padding = EdgeInsets.zero,
    this.orientation = MyTexttileOrientation.HORIZONTAL,
  }) : super(key: key);

  final String? text;
  final int textFlex;
  final int labelFlex;
  final int? maxLines;
  final bool hasDivider;
  final String titleText;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final bool isHideIfTextNull;
  final EdgeInsetsGeometry padding;
  final MyTexttileOrientation orientation;

  static Widget showList({
    int? maxLines,
    int textFlex = 2,
    int labelFlex = 5,
    required List<MyTexttileItem> items,
  }) {
    return Column(
      children: items.map((element) {
        return Padding(
          padding: const EdgeInsetsGeometry.symmetric(vertical: 6),
          child: MyTexttile(
            textFlex: textFlex,
            maxLines: maxLines,
            text: element.text,
            labelFlex: labelFlex,
            titleText: element.titleText,
          ),
        );
      }).toList(),
    );
  }

  String get textTrimed {
    return (text ?? '').trim();
  }

  @override
  Widget build(BuildContext context) {
    if (isHideIfTextNull && textTrimed.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: padding,
      child: Column(
        children: [
          if (orientation == MyTexttileOrientation.VERTICAL)
            _buildVertical(context)
          else
            _buildHorizontal(context),
          Visibility(
            visible: hasDivider,
            child: const Padding(
              child: Divider(height: 1.0),
              padding: EdgeInsetsGeometry.only(top: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      titleText,
      style:
          labelStyle ??
          AppTextStyles.body2.copyWith(color: AppColors.textGrey2),
    );
  }

  Widget _buildText() {
    return SelectableText(
      textTrimed,
      minLines: 1,
      maxLines: maxLines,
      style:
          textStyle ??
          AppTextStyles.body2.copyWith(color: AppColors.textGreyDark),
    );
  }

  Widget _buildHorizontal(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: labelFlex, child: _buildTitle()),
        const SizedBox(width: 7.0),
        Expanded(flex: textFlex, child: _buildText()),
      ],
    );
  }

  Widget _buildVertical(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [_buildTitle(), const SizedBox(height: 3.0), _buildText()],
    );
  }
}
