import 'package:flutter/material.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/models/selector_interface.dart';
import 'package:flutter_base/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:flutter_base/widgets/selector/selector_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../text_field/text_field_widget.dart';
import '../selector_state_controller.dart';
import 'bottomsheet_selector_content_widget.dart';

class MyBottomsheetSelector extends StatefulWidget implements SelectorInterface {
  @override
  final MySelectorArguments? argument;
  @override
  final SelectorController? controller;
  @override
  final List<MySelectorModel> Function()? getStaticData;

  const MyBottomsheetSelector({
    Key? key,
    this.argument,
    this.controller,
    this.getStaticData,
  }) : super(key: key);

  @override
  State<MyBottomsheetSelector> createState() => _MyBottomsheetSelectorState();
}

class _MyBottomsheetSelectorState extends State<MyBottomsheetSelector> {
  SelectorController? get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    controller?.addListener(() {
      controller?.text = textValue;
      Get.find<SelectorStateController>().updateTitleName(textValue);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  String get textValue {
    return controller?.first?.name ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SelectorStateController(
        argument: widget.argument,
        getStaticData: widget.getStaticData,
      ),
      builder: (bottomSheetController) {
        return MyTextField(
          readOnly: true,
          controller: controller,
          labelText: 'MyBottomsheetSelector',
          onTap: () async {
            final data = await MyBottomSheet.showDraggableScrollableSheet<List<MySelectorModel>>(
              context,
              builder: (context, scrollController) {
                return MyBottomsheetSelectorContent.buildBottomSheetContent(
                  context,
                  scrollController,
                  controller: bottomSheetController,
                );
              },
            );
            controller?.selectors = data ?? [];
          },
        );
      },
    );
  }
}
