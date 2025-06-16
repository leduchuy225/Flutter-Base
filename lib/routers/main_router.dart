// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../ui/authentication/login_screen.dart';
// import '../ui/empty/empty_screen.dart';
// // import '../ui/main/main_page.dart';

// class MainRouter {
//   static const String MAIN = '/';
//   static const String HOME = '/home';
//   // static const String COUNTER = '/counter';
//   static const String SETTINGS = '/settings';

//   // MobiFiber route
//   static const String LOGIN = '/login';
//   static const String RESET_PASSWORD = '/reset-password';

//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case LOGIN:
//         return GetPageRoute(page: () => const LoginScreen());
//       // case RESET_PASSWORD:
//       //   return GetPageRoute(page: () => const ResetPasswordScreen());
//       // case MAIN:
//       //   return GetPageRoute(page: () => const LoginScreen());
//       // return GetPageRoute(page: () => MainPage());
//       // case HOME:
//       //   return GetPageRoute(page: () => HomeScreen());
//       // case SETTINGS:
//       //   return GetPageRoute(page: () => SettingsScreen());
//       // case COUNTER:
//       //   return GetPageRoute(
//       //     page: () => const CounterPage(),
//       //     binding: BindingsBuilder.put(() => CounterPageState()),
//       //   );
//       default:
//         return GetPageRoute(page: () => const EmptyScreen());
//     }
//   }
// }
