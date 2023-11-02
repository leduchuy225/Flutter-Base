import 'package:flutter/cupertino.dart';

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
          builder: (context) => pages[index].page,
        );
      },
      tabBar: CupertinoTabBar(
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
