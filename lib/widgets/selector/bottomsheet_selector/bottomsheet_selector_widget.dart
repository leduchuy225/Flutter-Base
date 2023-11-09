import 'package:flutter/material.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/models/selector_interface.dart';
import 'package:flutter_base/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:flutter_base/widgets/selector/selector_controller.dart';
import 'package:get/get.dart';

import '../../text_field/text_field_widget.dart';
import '../selector_state.dart';
import 'bottomsheet_selector_content_widget.dart';

class MyBottomsheetSelector extends StatefulWidget implements SelectorInterface {
  @override
  final MySelectorArguments? argument;
  @override
  final MySelectorController? controller;
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
  MySelectorController get _mainController => widget.controller ?? MySelectorController();

  @override
  void initState() {
    super.initState();
    _mainController.addListener(() {
      if (_mainController.text != textValue) {
        updateTextValue();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _mainController.dispose();
  }

  void updateTextValue() {
    _mainController.text = textValue;
  }

  String get textValue {
    // TODO Update if having multiple data
    return _mainController.first?.name ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SelectorState(
        argument: widget.argument,
        getStaticData: widget.getStaticData,
      ),
      builder: (bottomSheetController) {
        return MyTextField(
          readOnly: true,
          controller: _mainController,
          labelText: 'MyBottomsheetSelector',
          onTap: () async {
            final data = await MyBottomSheet.showDraggableScrollableSheet<List<MySelectorModel>>(
              context,
              builder: (context, scrollController) {
                return MyBottomsheetSelectorContent.buildBottomSheetContent(
                  context,
                  scrollController,
                );
              },
            );
            if (data != null) {
              _mainController.selectors = data;
            }
          },
        );
      },
    );
  }
}
