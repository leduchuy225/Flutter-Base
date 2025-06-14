import 'package:flutter/material.dart';

import '../widgets/dialog/dialog_widget.dart';
import 'styles.dart';

// ThemeData mainTheme = ThemeData(
//   fontFamily: AppFonts.roboto,
//   brightness: Brightness.light,
//   primarySwatch: Colors.blue,
//   // colorSchemeSeed: Colors.white,
//   scaffoldBackgroundColor: Colors.white,
//   visualDensity: VisualDensity.adaptivePlatformDensity,
//   colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
//   appBarTheme: const AppBarTheme(
//     backgroundColor: Colors.white,
//     foregroundColor: Colors.black,
//   ),
//   // textTheme: TextTheme(
//   //   titleLarge: AppTextStyles.title1,
//   //   titleMedium: AppTextStyles.title2,
//   //   bodyLarge: AppTextStyles.body1,
//   //   bodyMedium: AppTextStyles.body2,
//   //   bodySmall: AppTextStyles.body3,
//   // ),
// );

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
        return [AppColors.error, AppColors.textLight];
      case SnackbarType.INFORMATION:
        return [AppColors.info, AppColors.textLight];
      case SnackbarType.WARNING:
        return [AppColors.warning, AppColors.textLight];
      case SnackbarType.SUCCESS:
        return [AppColors.success, AppColors.textLight];
    }
  }
}

// import 'package:flutter/material.dart';

// import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static const textFormFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: AppColors.textGrey1, width: 1),
  );

  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.primary,
    scaffoldBackgroundColor: AppColors.bgColorScreen,
    appBarTheme: const AppBarTheme(foregroundColor: AppColors.textLight),
    // dialogTheme: const DialogThemeData(
    //   titleTextStyle: TextStyle(color: Colors.amber),
    //   contentTextStyle: TextStyle(color: Colors.amber),
    // ),
    // textTheme: const TextTheme(
    //   titleLarge: TextStyle(
    //     fontWeight: FontWeight.bold,
    //     color: Colors.white,
    //     fontSize: 34,
    //     letterSpacing: 0.5,
    //   ),
    //   bodySmall: TextStyle(
    //     color: Colors.grey,
    //     fontSize: 14,
    //     letterSpacing: 0.5,
    //   ),
    // ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      // errorStyle: TextStyle(fontSize: 12),
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      border: textFormFieldBorder,
      errorBorder: textFormFieldBorder,
      focusedBorder: textFormFieldBorder,
      focusedErrorBorder: textFormFieldBorder,
      enabledBorder: textFormFieldBorder,
      // labelStyle: TextStyle(
      //   fontSize: 17,
      //   color: Colors.grey,
      //   fontWeight: FontWeight.w500,
      // ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(4),
        foregroundColor: AppColors.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        // textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, 50),
        side: BorderSide(color: Colors.grey.shade200),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        disabledBackgroundColor: Colors.grey.shade300,
        minimumSize: const Size(double.infinity, 52),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    ),
    // filledButtonTheme: FilledButtonThemeData(
    //   style: FilledButton.styleFrom(
    //     foregroundColor: Colors.black,
    //     backgroundColor: AppColors.primary,
    //     disabledBackgroundColor: Colors.grey.shade300,
    //     minimumSize: const Size(double.infinity, 52),
    //     shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(Radius.circular(12)),
    //     ),
    //     // textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    //   ),
    // ),
  );

  // static const TextStyle titleLarge = TextStyle(
  //   fontWeight: FontWeight.bold,
  //   color: Colors.white,
  //   fontSize: 34,
  //   letterSpacing: 0.5,
  // );

  // static const TextStyle bodySmall = TextStyle(
  //   color: Colors.grey,
  //   letterSpacing: 0.5,
  // );
}
