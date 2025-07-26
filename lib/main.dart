import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/app_binding.dart';
import 'package:flutter_base/core/services/service_locator.dart';
import 'package:flutter_base/data/api_locator.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'theme/app_theme.dart';
import 'ui/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
      theme: AppTheme.themeData,
      initialBinding: AppBinding(),
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VI'),
        Locale.fromSubtags(languageCode: 'vi'),
      ],
      onGenerateRoute: (settings) {
        return GetPageRoute(page: () => const SplashScreen());
        // return GetPageRoute(page: () => const LoginScreen());
      },
      builder: (context, child) {
        return SafeArea(child: KeyboardDismissOnTap(child: child!), top: false);
      },

      // initialRoute: MainRouter.LOGIN,
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
      // defaultTransition: Transition.cupertino,
      // onGenerateRoute: MainRouter.generateRoute,
    );
  }
}
