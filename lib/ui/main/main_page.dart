import 'package:flutter/material.dart';
import 'package:flutter_base/ui/home/home_page.dart';
import 'package:flutter_base/ui/settings/settings_page.dart';
import 'package:flutter_base/widgets/bottom_navigation/bottom_navigation_widget.dart';

import '../../widgets/bottom_navigation/bottom_navigation_tab.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<GlobalKey<NavigatorState>> tabKeys = [GlobalKey<NavigatorState>(), GlobalKey<NavigatorState>()];

  @override
  Widget build(BuildContext context) {
    return MyBottomNavigation(
      pages: [
        BottomNavigationTab(
          label: 'Home',
          key: tabKeys[0],
          page: HomePage(),
          icon: const Icon(Icons.home),
        ),
        BottomNavigationTab(
          label: 'Setting',
          key: tabKeys[1],
          page: SettingsPage(),
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
