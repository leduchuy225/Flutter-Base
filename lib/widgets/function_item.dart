import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';

import 'title_number_indicator.dart';

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
  final int? counter;
  final String title;
  final IconData icon;

  final void Function() onTap;

  const MainFunctionItem({
    super.key,
    this.counter,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsetsGeometry.all(10),
              child: Column(
                children: [
                  const SizedBox(),
                  Icon(icon, color: AppColors.primary, size: 28),
                  Text(
                    title,
                    style: AppTextStyles.body2,
                    textAlign: TextAlign.center,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
          Visibility(
            visible: (counter ?? 0) > 0,
            child: Positioned(
              top: 8,
              right: 8,
              child: TitleNumberIndicator.getnumber(
                counter,
                radius: 50,
                fontSize: 10,
                padding: const EdgeInsets.all(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
