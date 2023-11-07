import 'package:flutter/material.dart';

class MyBottomSheet {
  static Future<T?> showDraggableScrollableSheet<T>(
    BuildContext context, {
    required Widget Function(BuildContext, ScrollController) builder,
  }) {
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      // backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: builder,
          maxChildSize: 0.9,
          minChildSize: 0.3,
          initialChildSize: 0.5,
        );
      },
    );
  }
}
