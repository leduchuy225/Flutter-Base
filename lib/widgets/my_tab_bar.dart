import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  final List<Tab> tabs;
  final List<Widget> children;

  const MyTabBar({super.key, required this.tabs, required this.children});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: Builder(
        builder: (context) {
          final controller = DefaultTabController.of(context);
          return Column(
            children: <Widget>[
              TabBar(
                onTap: (index) {
                  setState(() {
                    controller.animateTo(index);
                  });
                },
                tabs: widget.tabs,
              ),
              widget.children[controller.index],
            ],
          );
        },
      ),
    );
  }
}
