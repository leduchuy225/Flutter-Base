import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../selector_state.dart';

class MyBottomsheetSelectorContent {
  static Widget buildBottomSheetContent(
    BuildContext context,
    ScrollController scrollController, {
    required SelectorState controller,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                child: const Text('Cancel'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Center(
                  child: Obx(
                    () => Text(controller.title.value),
                  ),
                ),
              ),
              InkWell(
                child: const Text('Done'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Obx(
              () => ListView.builder(
                controller: scrollController,
                itemCount: controller.dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(controller.dataList[index].name),
                    onTap: () {
                      controller.select([controller.dataList[index]]);
                      Navigator.pop(
                        context,
                        controller.dataChoosen.toList(),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
