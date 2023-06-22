import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/empty_page/empty_page.dart';
import '../ui/home/home_page.dart';
import '../ui/settings/settings_page.dart';

class MainRouter {
  static const String HOME = '/';
  static const String SETTINGS = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return GetPageRoute(
          page: () => HomePage(),
        );
      case SETTINGS:
        return GetPageRoute(
          page: () => SettingsPage(),
        );
      default:
        return GetPageRoute(
          page: () => EmptyPage(),
        );
    }
  }
}
