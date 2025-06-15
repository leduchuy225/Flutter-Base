import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';

class MyAppbar {
  MyAppbar._();

  static AppBar appBar(String title) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: AppColors.defaultGradient),
        ),
      ),
    );
  }
}
