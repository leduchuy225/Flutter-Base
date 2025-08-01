import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';

import '../core/utils/utils.dart';
import 'my_tag_widget.dart';

enum MyTexttileOrientation { VERTICAL, HORIZONTAL }

class MyTexttileItem {
  final dynamic text;
  final String? titleText;

  final bool isCopy;
  final bool isHide;
  final bool isPhoneNumber;

  final Widget? child;

  MyTexttileItem({
    this.text,
    this.child,
    this.titleText,
    this.isCopy = false,
    this.isHide = false,
    this.isPhoneNumber = false,
  });
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

  final dynamic text;
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
    String? tag,
    int? maxLines,
    Widget? child,
    String? title,
    Color? tagColor,
    int textFlex = 5,
    int labelFlex = 2,
    Widget? suffixHeader,
    bool isViewDetail = false,
    EdgeInsets? paddingHeader,
    List<MyTexttileItem>? items,
    void Function()? onTapViewDetail,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    return Column(
      mainAxisSize: mainAxisSize,
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
              AppStyles.pdl10,
              ?suffixHeader,
              if (tag != null)
                Padding(
                  padding: const EdgeInsetsGeometry.only(left: 10),
                  child: MyTag(text: tag, foregroundColor: tagColor),
                ),
              if (isViewDetail)
                Padding(
                  padding: const EdgeInsetsGeometry.only(left: 10),
                  child: InkWell(
                    onTap: onTapViewDetail,
                    child: const MyTag(icon: Icons.menu),
                  ),
                ),
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
          child:
              child ??
              MyTexttile.list(
                items: items ?? [],
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
        if (element.isHide) {
          return const SizedBox.shrink();
        }
        if (element.child != null) {
          return element.child!;
        }
        return MyTexttile(
          textFlex: textFlex,
          maxLines: maxLines,
          text: element.text,
          labelFlex: labelFlex,
          titleText: element.titleText,
          isShowCopyIcon: element.isCopy,
          isPhoneNumber: element.isPhoneNumber,
          padding: const EdgeInsetsGeometry.symmetric(vertical: 6),
        );
      }).toList(),
    );
  }

  String get _textProcessed {
    final textProcessed = (text ?? '').toString().trim();
    return textProcessed;
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
            onTap: () async {
              await launchMyURL('tel://${getNumericOnly(_textProcessed)}');
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
