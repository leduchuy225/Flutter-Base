import 'package:flutter/material.dart';
import 'package:flutter_base/ui/counter/counter_page.dart';
import 'package:flutter_base/ui/counter/counter_page_controller.dart';
import 'package:get/get.dart';

import '../ui/empty/empty_page.dart';
import '../ui/home/home_page.dart';
import '../ui/main/main_page.dart';
import '../ui/settings/settings_page.dart';

class MainRouter {
  static const String MAIN = '/';
  static const String HOME = '/home';
  static const String COUNTER = '/counter';
  static const String SETTINGS = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MAIN:
        return GetPageRoute(page: () => MainPage());
      case HOME:
        return GetPageRoute(page: () => HomePage());
      case SETTINGS:
        return GetPageRoute(page: () => SettingsPage());
      case COUNTER:
        return GetPageRoute(
          page: () => const CounterPage(),
          binding: BindingsBuilder.put(() => CounterPageController()),
        );
      default:
        return GetPageRoute(page: () => const EmptyPage());
    }
  }
}
