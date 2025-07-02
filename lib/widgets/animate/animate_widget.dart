import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'animate_controller.dart';

class MyAnimateWidget extends StatefulWidget {
  final Widget child;
  final MyAnimateController controller;
  final List<Effect<dynamic>>? effects;

  const MyAnimateWidget({
    super.key,
    required this.child,
    this.effects,
    required this.controller,
  });

  @override
  State<MyAnimateWidget> createState() => _MyAnimateWidgetState();
}

class _MyAnimateWidgetState extends State<MyAnimateWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _myAnimateController;

  void animate() {
    if (_myAnimateController.isCompleted) {
      _myAnimateController.reverse();
    } else {
      _myAnimateController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _myAnimateController = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.animate = animate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      autoPlay: false,
      child: widget.child,
      effects: widget.effects,
      controller: _myAnimateController,
    );
  }
}
