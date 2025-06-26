import 'package:flutter/material.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/selector/selector_controller.dart';
import 'package:get/get.dart';

import '../../search_field/search_field_widget.dart';

class MyBottomsheetSelectorContent extends StatefulWidget {
  final String title;
  final MySelectorData data;
  final MySelectorController controller;
  final ScrollController scrollController;

  const MyBottomsheetSelectorContent({
    required this.data,
    required this.title,
    required this.controller,
    required this.scrollController,
  });

  @override
  State<MyBottomsheetSelectorContent> createState() =>
      _MyBottomsheetSelectorContentState();
}

class _MyBottomsheetSelectorContentState
    extends State<MyBottomsheetSelectorContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((data) async {
      await widget.data.updateDataList();
    });
  }

  void _onChanged(MySelectorModel? item) {
    if (item == null) {
      return;
    }
    widget.controller.selectors = [item];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              TextButton(
                child: Text('Hủy', style: AppTextStyles.body2),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Center(
                  child: Text(widget.title, style: AppTextStyles.body1),
                ),
              ),
              TextButton(
                child: Text('OK', style: AppTextStyles.body2),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsGeometry.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: MySearchField(
              onFiltered: (text) {
                widget.data.searchInList(text);
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: widget.controller,
              builder: (context, value, child) {
                return Obx(() {
                  if (widget.data.isLoading.isTrue) {
                    return const SizedBox(
                      width: 60,
                      height: 60,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return ListView.builder(
                    controller: widget.scrollController,
                    itemCount: widget.data.dataListShow.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = widget.data.dataListShow[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: item.description != null
                            ? Text(item.description ?? '')
                            : null,
                        leading: Radio<MySelectorModel?>(
                          value: item,
                          groupValue: widget.controller.first,
                          onChanged: (data) {
                            _onChanged(data);
                          },
                        ),
                        onTap: () {
                          _onChanged(item);
                        },
                      );
                    },
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
