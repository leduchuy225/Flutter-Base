import 'package:flutter/material.dart';
import 'package:flutter_base/core/app_binding.dart';
import 'package:flutter_base/data/api_locator.dart';
import 'package:flutter_base/services/service_locator.dart';
import 'package:get/get.dart';

import 'routers/main_router.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialBinding: AppBinding(),
      // darkTheme: AppTheme.themeData.copyWith(
      //   brightness: Brightness.dark,
      //   textTheme: const TextTheme(
      //     bodyMedium: TextStyle(
      //       color: Colors.green,
      //     ),
      //   ),
      //   appBarTheme: AppBarTheme(
      //     color: Colors.green.shade100,
      //   ),
      // ),
      defaultTransition: Transition.cupertino,
      onGenerateRoute: MainRouter.generateRoute,
      builder: (context, child) {
        return SafeArea(child: child!);
      },
    );
  }
}
