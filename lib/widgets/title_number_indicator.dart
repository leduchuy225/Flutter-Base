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

  static Widget getnumber(dynamic number) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      child: Text(
        number.toString(),
        style: const TextStyle(color: AppColors.textLight),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title, style: AppTextStyles.body1)),
        TitleNumberIndicator.getnumber(number),
      ],
    );
  }
}
