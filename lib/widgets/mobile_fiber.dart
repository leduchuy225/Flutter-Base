import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';

class MobileFiber extends StatelessWidget {
  final TextStyle? style;

  const MobileFiber({super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final _textStyle = style ?? AppTextStyles.h1;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.textLight,
        borderRadius: AppCorners.lgBorder,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Mobi', style: _textStyle.copyWith(color: AppColors.primary)),
          Text('Fiber', style: _textStyle.copyWith(color: AppColors.secondary)),
        ],
      ),
    );
  }
}
