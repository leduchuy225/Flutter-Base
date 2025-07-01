import 'package:flutter/material.dart';

import '../../../theme/styles.dart';
import '../../../widgets/gradient_background.dart';
import '../../../widgets/mobile_fiber.dart';

class AuthenticationScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? bottomChild;

  const AuthenticationScaffold({
    super.key,
    this.bottomChild,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                GradientBackground(
                  children: [
                    MobileFiber(style: AppTextStyles.h1),
                    AppStyles.pdt15,
                    Text(
                      title,
                      style: AppTextStyles.h2.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.all(20), child: child),
              ],
            ),
          ),
          if (bottomChild != null)
            Padding(padding: const EdgeInsets.all(20), child: bottomChild),
        ],
      ),
    );
  }
}
