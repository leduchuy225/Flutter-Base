import 'package:flutter/material.dart';

class ScrollViewWithBottom extends StatelessWidget {
  final Widget bodyChild;
  final Widget? bottomChild;
  final EdgeInsets? padding;

  const ScrollViewWithBottom({
    super.key,
    this.padding,
    this.bottomChild,
    required this.bodyChild,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(padding: padding, child: bodyChild),
        if (bottomChild != null)
          Padding(padding: const EdgeInsets.all(20), child: bottomChild),
      ],
    );
  }
}
