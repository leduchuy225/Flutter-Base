import 'package:flutter/cupertino.dart';

class BottomNavigationTab {
  final Widget page;
  final Widget icon;
  final String label;
  final GlobalKey<NavigatorState> key;

  BottomNavigationTab({
    required this.key,
    required this.page,
    required this.icon,
    required this.label,
  });
}
