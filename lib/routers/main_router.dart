import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/authentication/login_screen.dart';
import '../ui/empty/empty_screen.dart';
import '../ui/home/home_screen.dart';
// import '../ui/main/main_page.dart';
import '../ui/settings/settings_screen.dart';

class MainRouter {
  static const String MAIN = '/';
  static const String HOME = '/home';
  // static const String COUNTER = '/counter';
  static const String SETTINGS = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MAIN:
        return GetPageRoute(page: () => const LoginScreen());
      // return GetPageRoute(page: () => MainPage());
      case HOME:
        return GetPageRoute(page: () => HomeScreen());
      case SETTINGS:
        return GetPageRoute(page: () => SettingsScreen());
      // case COUNTER:
      //   return GetPageRoute(
      //     page: () => const CounterPage(),
      //     binding: BindingsBuilder.put(() => CounterPageState()),
      //   );
      default:
        return GetPageRoute(page: () => const EmptyScreen());
    }
  }
}
