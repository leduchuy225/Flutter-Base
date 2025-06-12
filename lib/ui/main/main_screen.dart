import 'package:flutter/material.dart';
import 'package:flutter_base/ui/home/home_screen.dart';
import 'package:flutter_base/ui/settings/settings_screen.dart';
import 'package:flutter_base/widgets/bottom_navigation/bottom_navigation_widget.dart';

import '../../widgets/bottom_navigation/bottom_navigation_tab.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<GlobalKey<NavigatorState>> tabKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return MyBottomNavigation(
      pages: [
        BottomNavigationTab(
          label: 'Home',
          key: tabKeys[0],
          page: HomeScreen(),
          icon: const Icon(Icons.home),
        ),
        BottomNavigationTab(
          label: 'Setting',
          key: tabKeys[1],
          page: SettingsScreen(),
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
