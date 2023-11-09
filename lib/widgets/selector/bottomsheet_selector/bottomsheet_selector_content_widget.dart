import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../selector_state.dart';

class MyBottomsheetSelectorContent {
  static Widget buildBottomSheetContent(
    BuildContext context,
    ScrollController scrollController,
  ) {
    return _MyBottomsheetSelectorContent(
      scrollController: scrollController,
    );
  }
}

class _MyBottomsheetSelectorContent extends StatefulWidget {
  final ScrollController scrollController;

  const _MyBottomsheetSelectorContent({required this.scrollController});

  @override
  State<_MyBottomsheetSelectorContent> createState() => _MyBottomsheetSelectorContentState();
}

class _MyBottomsheetSelectorContentState extends State<_MyBottomsheetSelectorContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<SelectorState>().updateDataList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SelectorState>();

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
              () {
                if (controller.isLoading.isTrue) {
                  return const SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return ListView.builder(
                  controller: widget.scrollController,
                  itemCount: controller.dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = controller.dataList[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.description ?? ''),
                      onTap: () {
                        controller.select([item]);
                        Navigator.pop(
                          context,
                          controller.dataChoosen.toList(),
                        );
                      },
                    );
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
