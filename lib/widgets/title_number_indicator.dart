import 'package:flutter/widgets.dart';
import 'package:flutter_base/theme/styles.dart';

class TitleNumberIndicator extends StatelessWidget {
  final String title;
  final dynamic number;

  const TitleNumberIndicator({
    super.key,
    required this.title,
    required this.number,
  });

  static Widget getnumber(
    dynamic number, {
    double? radius,
    double? fontSize,
    EdgeInsets? padding,
    Color color = AppColors.error,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 16)),
      ),
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Text(
        number.toString(),
        style: TextStyle(color: AppColors.textLight, fontSize: fontSize),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title, style: AppTextStyles.title1)),
        TitleNumberIndicator.getnumber(number),
      ],
    );
  }
}
