import 'package:flutter/material.dart';
import 'package:flutter_base/data/api_locator.dart';
import 'package:flutter_base/services/service_locator.dart';
import 'package:get/get.dart';

import 'routers/main_router.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    setupServiceLocator();
    setupApiLocator();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: AppTheme.themeData,
      onGenerateRoute: MainRouter.generateRoute,
    );
  }
}
