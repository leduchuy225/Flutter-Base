import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/selector/selector_controller.dart';
import 'package:get/get.dart';

import '../../search_field/search_field_widget.dart';

enum SelectorActionEnum { SET, ADD, REMOVE }

class MyBottomsheetSelectorContent extends StatefulWidget {
  final String title;
  final MySelectorData data;
  final bool isMultipleSelect;
  final bool isDismissOnSelect;
  final MySelectorController controller;
  final ScrollController scrollController;

  const MyBottomsheetSelectorContent({
    required this.data,
    required this.title,
    required this.controller,
    this.isMultipleSelect = false,
    this.isDismissOnSelect = true,
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.data.updateDataList();
    });
  }

  void _onChanged(MySelectorModel? item, {required SelectorActionEnum action}) {
    if (item == null) {
      return;
    }
    switch (action) {
      case SelectorActionEnum.SET:
        widget.controller.selectors = [item];
        break;
      case SelectorActionEnum.ADD:
        widget.controller.selectors = widget.controller.selectors..add(item);
        break;
      case SelectorActionEnum.REMOVE:
        widget.controller.selectors = widget.controller.selectors..remove(item);
        break;
    }

    if (widget.isDismissOnSelect && !widget.isMultipleSelect) {
      Get.back();
    }
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
                child: Text('Đóng', style: AppTextStyles.body2),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Text(
                  widget.title,
                  style: AppTextStyles.body1,
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('')),
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
                  if (widget.data.dataListShow.isEmpty) {
                    return const Padding(
                      padding: AppStyles.horizontalPadding,
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: AppColors.black,
                          ),
                          AppStyles.pdl5,
                          Text(MyStrings.noData),
                        ],
                      ),
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
                            ? Text(
                                item.description ?? '',
                                style: AppTextStyles.body2.copyWith(
                                  color: AppColors.textGrey2,
                                ),
                              )
                            : null,
                        leading: widget.isMultipleSelect
                            ? Checkbox(
                                value: widget.controller.selectors.contains(
                                  item,
                                ),
                                onChanged: (data) {
                                  _onChanged(
                                    item,
                                    action: data == true
                                        ? SelectorActionEnum.ADD
                                        : SelectorActionEnum.REMOVE,
                                  );
                                },
                              )
                            : Radio<MySelectorModel?>(
                                value: item,
                                groupValue: widget.controller.first,
                                onChanged: (data) {
                                  _onChanged(
                                    data,
                                    action: SelectorActionEnum.SET,
                                  );
                                },
                              ),
                        onTap: () {
                          var action = SelectorActionEnum.SET;
                          if (widget.isMultipleSelect) {
                            if (widget.controller.selectors.contains(item)) {
                              action = SelectorActionEnum.REMOVE;
                            } else {
                              action = SelectorActionEnum.ADD;
                            }
                          }
                          _onChanged(item, action: action);
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
