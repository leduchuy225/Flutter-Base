import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum MyTexttileOrientation { VERTICAL, HORIZONTAL }

class MyTexttileItem {
  final String? text;
  final String? titleText;
  final bool isPhoneNumber;

  MyTexttileItem({this.text, this.titleText, this.isPhoneNumber = false});
}

class MyTexttile extends StatelessWidget {
  const MyTexttile({
    Key? key,
    this.text,
    this.maxLines,
    this.textStyle,
    this.titleText,
    this.labelStyle,
    this.textFlex = 5,
    this.labelFlex = 2,
    this.hasDivider = true,
    this.isPhoneNumber = false,
    this.isShowCopyIcon = false,
    this.isWithoutTitle = false,
    this.isHideIfTextNull = false,
    this.padding = EdgeInsets.zero,
    this.orientation = MyTexttileOrientation.HORIZONTAL,
  }) : super(key: key);

  final String? text;
  final int textFlex;
  final int labelFlex;
  final int? maxLines;
  final bool hasDivider;
  final String? titleText;
  final bool isPhoneNumber;
  final bool isShowCopyIcon;
  final bool isWithoutTitle;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final bool isHideIfTextNull;
  final EdgeInsetsGeometry padding;
  final MyTexttileOrientation orientation;

  static Widget card({
    int? maxLines,
    String? title,
    int textFlex = 5,
    int labelFlex = 2,
    Widget? suffixHeader,
    EdgeInsets? paddingHeader,
    required List<MyTexttileItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding:
              paddingHeader ??
              const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: const BoxDecoration(
            color: AppColors.bgHeaderItem,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: SelectableText(title ?? '', style: AppTextStyles.body1),
              ),
              AppStyles.pdl5,
              ?suffixHeader,
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: AppColors.bgChildItem,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: MyTexttile.list(
            items: items,
            maxLines: maxLines,
            textFlex: textFlex,
            labelFlex: labelFlex,
          ),
        ),
      ],
    );
  }

  static Widget list({
    int? maxLines,
    int textFlex = 5,
    int labelFlex = 2,
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
            isPhoneNumber: element.isPhoneNumber,
          ),
        );
      }).toList(),
    );
  }

  String get _textProcessed {
    return (text ?? '').trim();
  }

  @override
  Widget build(BuildContext context) {
    if (isHideIfTextNull && _textProcessed.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: padding,
      child: Column(
        children: [
          if (titleText == null)
            _buildText()
          else if (orientation == MyTexttileOrientation.VERTICAL)
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
      titleText ?? '',
      style:
          labelStyle ??
          AppTextStyles.body2.copyWith(color: AppColors.textGrey2),
    );
  }

  Widget _buildText() {
    return Row(
      children: [
        Expanded(
          child: SelectableText(
            _textProcessed,
            minLines: 1,
            maxLines: maxLines,
            style:
                textStyle ??
                AppTextStyles.body2.copyWith(color: AppColors.textGreyDark),
          ),
        ),
        Visibility(
          visible: isPhoneNumber && _textProcessed.isNotEmpty,
          child: InkWell(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(Icons.phone, color: AppColors.primary),
            ),
            onTap: () {
              final phoneNumber = _textProcessed.replaceAll(
                RegExp(r'[^0-9]'),
                '',
              );
              launchUrlString('tel://$phoneNumber');
            },
          ),
        ),
        Visibility(
          visible: isShowCopyIcon && _textProcessed.isNotEmpty,
          child: InkWell(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(Icons.copy, color: AppColors.primary),
            ),
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: _textProcessed));
              MyDialog.snackbar(
                'Đã sao chép nội dung',
                type: SnackbarType.SUCCESS,
              );
            },
          ),
        ),
      ],
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
