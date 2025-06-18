import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';

enum MyTexttileOrientation { VERTICAL, HORIZONTAL }

class MyTexttile extends StatelessWidget {
  const MyTexttile({
    Key? key,
    // this.query,
    required this.titleText,
    this.text,
    this.labelFlex = 2,
    this.textFlex = 5,
    // this.selectable = true,
    this.hasDivider = true,
    // this.maxLines = 2,
    // this.minLines = 1,
    // this.isPhoneNumber = false,
    // this.size = OneTextSize.middle,
    // this.state = OneTextState.normal,
    // this.crossAxisAlignment = CrossAxisAlignment.start,
    // this.mainAxisAlignment = MainAxisAlignment.start,
    // this.textAlign,
    // this.titleTextAlign,
    // this.textColor = OneColors.textGreyDark,
    this.padding = EdgeInsets.zero,
    // this.orientation = OneOrientation.HORIZONTAL,
    // this.dividerColor = OneColors.textGrey1,
    // this.suffixIconAssetPath,
    this.labelStyle,
    this.textStyle,
    // this.onTapSuffixIcon,
    this.isHideIfTextNull = false,
    // this.onPressText,
    // this.isShowCopyIcon = false,
    this.orientation = MyTexttileOrientation.HORIZONTAL,
    // this.titleChild,
  }) : super(key: key);

  final String titleText;
  final String? text;
  final int labelFlex;
  final int textFlex;
  // final bool selectable;
  final bool hasDivider;
  // final int maxLines;
  // final int minLines;

  // final CrossAxisAlignment crossAxisAlignment;
  // final MainAxisAlignment mainAxisAlignment;
  // final TextAlign? textAlign;
  // final TextAlign? titleTextAlign;
  // final Color textColor;
  final EdgeInsetsGeometry padding;
  final MyTexttileOrientation orientation;
  // final Color dividerColor;
  // final String? suffixIconAssetPath;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  // final VoidCallback? onTapSuffixIcon;
  // final bool isPhoneNumber;
  // final String? query;
  final bool isHideIfTextNull;
  // final void Function()? onPressText;
  // final bool isShowCopyIcon;
  // final Widget? titleChild;

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
          Visibility(visible: hasDivider, child: const Divider(height: 1.0)),
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
    return Text(
      textTrimed,
      style:
          textStyle ??
          AppTextStyles.body2.copyWith(color: AppColors.textGreyDark),
    );
  }

  // Widget _buildSelectableText() {
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Expanded(child: Text(textTrimed)),
  //       // if (suffixIconAssetPath != null)
  //       //   InkWell(
  //       //     onTap: onTapSuffixIcon,
  //       //     child: Padding(
  //       //       padding: const EdgeInsets.symmetric(horizontal: 5),
  //       //       child: SvgPicture.asset(
  //       //         suffixIconAssetPath!,
  //       //         color: OneColors.brandVNPT,
  //       //       ),
  //       //     ),
  //       //   ),
  //       // if (isPhoneNumber && textTrimed.isNotEmpty)
  //       //   InkWell(
  //       //     child: const Padding(
  //       //       padding: EdgeInsets.symmetric(horizontal: 5),
  //       //       child: Icon(Icons.phone, color: OneColors.brandVNPT),
  //       //     ),
  //       //     onTap: () {
  //       //       final phoneNumber = textTrimed.replaceAll(RegExp(r'[^0-9]'), '');
  //       //       launchUrlString('tel://$phoneNumber');
  //       //     },
  //       //   ),
  //       // if (isShowCopyIcon && textTrimed.isNotEmpty)
  //       //   InkWell(
  //       //     child: const Padding(
  //       //       padding: EdgeInsets.symmetric(horizontal: 5),
  //       //       child: Icon(Icons.copy, color: OneColors.brandVNPT),
  //       //     ),
  //       //     onTap: () async {
  //       //       await Clipboard.setData(ClipboardData(text: textTrimed)).then((
  //       //         value,
  //       //       ) {
  //       //         OneToast.show(
  //       //           msg: 'Đã sao chép vào clipboard',
  //       //           type: OneToastType.SUCCESS,
  //       //         );
  //       //       });
  //       //     },
  //       //   ),
  //     ],
  //   );
  // }

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
