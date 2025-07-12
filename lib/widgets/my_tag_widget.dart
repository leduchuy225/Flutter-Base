import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';

class MyTag extends StatelessWidget {
  final String? text;
  final IconData icon;
  final Color? foregroundColor;
  final Color? backgroundColor;

  const MyTag({
    Key? key,
    this.text,
    this.backgroundColor = Colors.white,
    this.foregroundColor = AppColors.primary,
    this.icon = Icons.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          width: 1,
          color: foregroundColor ?? const Color(0xFF000000),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: foregroundColor, size: 20),
          if (text != null)
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 2),
              child: Text(
                text ?? '',
                maxLines: 1,
                style: AppTextStyles.callout2.copyWith(color: foregroundColor),
              ),
            ),
        ],
      ),
    );
  }
}
