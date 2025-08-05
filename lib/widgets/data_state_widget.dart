import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';

import '../core/const/constants.dart';

class MyDataState extends StatelessWidget {
  final IconData icon;
  final String message;

  const MyDataState({super.key, required this.icon, required this.message});

  static Widget empty() {
    return const MyDataState(
      message: MyStrings.noData,
      icon: Icons.unarchive_outlined,
    );
  }

  static Widget error(String? message) {
    return MyDataState(
      icon: Icons.error_outline,
      message: message ?? MyStrings.systemError,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppStyles.pdt25,
        Icon(icon, size: 80, color: AppColors.black),
        AppStyles.pdt15,
        Text(message, style: AppTextStyles.h3),
        AppStyles.pdt15,
      ],
    );
  }
}
