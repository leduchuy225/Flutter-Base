import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';

class FunctionItem extends StatelessWidget {
  final int counter;
  final String title;
  final IconData icon;

  final void Function() onTap;

  const FunctionItem({
    super.key,
    this.counter = 0,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: ListTile(
          title: Text(title),
          leading: Icon(icon),
          trailing: Visibility(
            visible: counter > 0,
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.error,
              ),
              alignment: Alignment.center,
              child: Text(
                counter.toString(),
                style: AppTextStyles.body1.copyWith(color: AppColors.textLight),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainFunctionItem extends StatelessWidget {
  final int counter;
  final String title;
  final IconData icon;

  final void Function() onTap;

  const MainFunctionItem({
    super.key,
    this.counter = 0,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: Column(
            children: [
              const SizedBox(),
              Icon(icon, color: AppColors.primary, size: 50),
              Text(title, style: AppTextStyles.title2),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
