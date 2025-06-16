import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:marquee/marquee.dart';

class MyAppbar {
  MyAppbar._();

  static AppBar appBar(String title) {
    return AppBar(
      centerTitle: true,
      title: AutoSizeText(
        title,
        maxLines: 1,
        minFontSize: AppFontSizes.s16,
        overflowReplacement: Container(
          height: 50,
          child: Marquee(
            text: title,
            blankSpace: 30,
            startAfter: const Duration(seconds: 2),
            pauseAfterRound: const Duration(seconds: 2),
          ),
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: AppColors.defaultGradient),
        ),
      ),
    );
  }
}
