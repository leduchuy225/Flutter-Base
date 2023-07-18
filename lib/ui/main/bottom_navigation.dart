import 'package:flutter/material.dart';

import '../home/home_page.dart';
import '../settings/settings_page.dart';

enum BottomNavigation { HOME, SETTINGS }

List<Widget> tabPages = [HomePage(), SettingsPage()];

List<GlobalKey<NavigatorState>> tabKeys = [GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>()];

extension BottomNavigationExt on BottomNavigation {
  GlobalKey<NavigatorState> get key {
    switch (this) {
      case BottomNavigation.HOME:
        return tabKeys[0];
      case BottomNavigation.SETTINGS:
        return tabKeys[1];
    }
  }
}
