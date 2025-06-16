import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:get/get.dart';

class MyBottomSheet {
  static Future<T?> showDraggableScrollableSheet<T>(
    BuildContext context, {
    required Widget Function(BuildContext, ScrollController) builder,
  }) {
    return MyBottomSheet.showBottomSheet(
      context,
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

  static Future<T?> showBottomSheet<T>(
    BuildContext context, {
    List<MyBottomSheetAction>? actions,
    Widget Function(BuildContext)? builder,
  }) {
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: AppColors.bgColorScreen,
      builder:
          builder ??
          (context) {
            return MyBottomSheetWidget(actions: actions ?? []);
          },
    );
  }
}

class MyBottomSheetAction {
  final dynamic id;
  final String title;
  final IconData? icon;
  final void Function(BuildContext, dynamic)? onTap;

  MyBottomSheetAction({
    this.icon,
    this.onTap,
    required this.id,
    required this.title,
  });
}

class MyBottomSheetWidget extends StatelessWidget {
  final String label;
  final bool isDismissOnTap;
  final List<MyBottomSheetAction> actions;

  const MyBottomSheetWidget({
    super.key,
    this.label = '',
    required this.actions,
    this.isDismissOnTap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: label.isNotEmpty,
            child: Padding(
              child: Text(label, style: AppTextStyles.h3),
              padding: const EdgeInsetsGeometry.only(bottom: 15),
            ),
          ),
          const Divider(height: 1, indent: 10, endIndent: 10),
          AppStyles.pdt10,
          ...actions.map((item) {
            return InkWell(
              onTap: () {
                if (item.onTap != null) {
                  if (isDismissOnTap) {
                    Get.back();
                  }
                  item.onTap!(context, item.id);
                }
              },
              child: Card(
                child: ListTile(
                  title: Text(item.title),
                  leading: Icon(item.icon),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
