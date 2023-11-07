import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_tab.dart';

class MyBottomNavigation extends StatelessWidget {
  final List<BottomNavigationTab> pages;

  const MyBottomNavigation({super.key, required this.pages});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          navigatorKey: pages[index].key,
          builder: (context) {
            return Padding(
              child: pages[index].page,
              padding: const EdgeInsets.only(
                bottom: kBottomNavigationBarHeight,
              ),
            );
          },
        );
      },
      tabBar: CupertinoTabBar(
        height: kBottomNavigationBarHeight,
        items: pages.map((e) {
          return BottomNavigationBarItem(
            icon: e.icon,
            label: e.label,
          );
        }).toList(),
      ),
    );
  }
}
