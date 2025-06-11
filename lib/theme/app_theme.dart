import 'package:flutter/material.dart';

import '../widgets/dialog/dialog_widget.dart';
import 'styles.dart';

ThemeData mainTheme = ThemeData(
  fontFamily: AppFonts.roboto,
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  // colorSchemeSeed: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  // textTheme: TextTheme(
  //   titleLarge: AppTextStyles.title1,
  //   titleMedium: AppTextStyles.title2,
  //   bodyLarge: AppTextStyles.body1,
  //   bodyMedium: AppTextStyles.body2,
  //   bodySmall: AppTextStyles.body3,
  // ),
);

// TextTheme textTheme = TextTheme(
//   displayLarge: TextStyle(height: 1.2, color: AppColors.black, fontSize: Get.width <= 667 ? 17 : 18, fontWeight: FontWeight.w700),
//   titleLarge: TextStyle(fontSize: Get.width <= 667 ? 18 : 20, height: 1.3, color: Colors.white, fontWeight: FontWeight.w700),
//   titleMedium: TextStyle(height: 1.2, color: AppColors.black, fontSize: Get.width <= 667 ? 13 : 14),
//   titleSmall: TextStyle(height: 1.2, color: AppColors.black, fontSize: Get.width <= 667 ? 12 : 13),
//   bodyLarge: TextStyle(fontSize: Get.width <= 667 ? 16 : 17, color: AppColors.black, height: 1.2, fontWeight: FontWeight.w700),
//   bodyMedium: TextStyle(
//     fontSize: Get.width <= 667 ? 15 : 16,
//     // color: AppColors.hintColor,
//     height: 1.2,
//     fontWeight: FontWeight.w400,
//   ),
//   labelLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: Get.width <= 667 ? 14 : 15, letterSpacing: 2),
// );

extension SnackbarTypeExtension on SnackbarType {
  List<Color> get colors {
    switch (this) {
      case SnackbarType.ERROR:
        return [Colors.red, Colors.white];
      case SnackbarType.INFORMATION:
        return [Colors.blue, Colors.white];
      case SnackbarType.WARNING:
        return [Colors.yellow, Colors.white];
      case SnackbarType.SUCCESS:
        return [Colors.green, Colors.white];
    }
  }
}
