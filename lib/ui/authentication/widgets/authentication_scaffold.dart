import 'package:flutter/material.dart';

import '../../../theme/styles.dart';
import '../../../widgets/gradient_background.dart';

class AuthenticationScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const AuthenticationScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          GradientBackground(
            children: [
              Text('MobiFiber', style: AppTextStyles.h1),
              AppStyles.pdt6,
              Text(title, style: AppTextStyles.h3),
            ],
          ),
          Padding(padding: const EdgeInsets.all(20), child: child),
        ],
      ),
    );
  }
}
