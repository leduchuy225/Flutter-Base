import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'checkbox_list_controller.dart';

class OneCheckboxList extends StatelessWidget {
  final String name;
  final EdgeInsets? margin;
  final Widget? suffixWidget;
  final CheckboxListController controller;

  const OneCheckboxList({
    Key? key,
    this.margin,
    this.suffixWidget,
    required this.name,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: const EdgeInsets.all(12), child: Text(name)),
            ],
          ),
          Obx(() {
            return Column(
              children: controller.value.map((e) {
                return CheckboxListTile(
                  value: e.value,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(e.name),
                  onChanged: (bool? value) {
                    controller.setValueById(e.id, value: value);
                  },
                );
              }).toList(),
            );
          }),
          suffixWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
