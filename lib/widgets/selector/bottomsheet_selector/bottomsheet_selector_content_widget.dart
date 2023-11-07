import 'package:flutter/material.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../selector_state_controller.dart';

class MyBottomsheetSelectorContent {
  static Widget buildBottomSheetContent(
    BuildContext context,
    ScrollController scrollController, {
    required SelectorStateController controller,
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
                  Navigator.pop(
                    context,
                    [MySelectorModel(id: 'Cancel', name: controller.title.value)],
                  );
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
                  Navigator.pop(
                    context,
                    [MySelectorModel(id: 'Done', name: controller.title.value)],
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                  onTap: () {
                    controller.updateTitleName(index.toString());
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
