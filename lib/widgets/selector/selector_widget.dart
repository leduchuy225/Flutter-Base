import 'package:flutter/material.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/widgets/dialog/bottom_sheet_widget.dart';
import 'package:flutter_base/widgets/selector/selector_controller.dart';

import '../text_field/text_field_widget.dart';
import 'selector_content/bottomsheet_selector_content_widget.dart';

class MySelector extends StatefulWidget {
  final String title;
  final Widget? suffixIcon;
  final MySelectorData data;
  final bool isMultipleSelect;
  final bool isDismissOnSelect;
  final MySelectorController? controller;
  final bool Function(MySelectorController)? onBeginSelect;

  const MySelector({
    Key? key,
    this.controller,
    this.suffixIcon,
    required this.data,
    this.onBeginSelect,
    required this.title,
    this.isDismissOnSelect = true,
    this.isMultipleSelect = false,
  }) : super(key: key);

  @override
  State<MySelector> createState() => _MySelectorState();
}

class _MySelectorState extends State<MySelector> {
  late final MySelectorController _controller;

  MySelectorController get _mainController => widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _controller = MySelectorController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      readOnly: true,
      labelText: widget.title,
      controller: _mainController,
      suffixIcon: widget.suffixIcon,
      onTap: () {
        if (widget.onBeginSelect != null &&
            widget.onBeginSelect!(_mainController) == false) {
          return;
        }
        MyBottomSheet.showDraggableScrollableSheet<List<MySelectorModel>>(
          context,
          builder: (context, scrollController) {
            return MyBottomsheetSelectorContent(
              data: widget.data,
              title: widget.title,
              controller: _mainController,
              scrollController: scrollController,
              isMultipleSelect: widget.isMultipleSelect,
            );
          },
        );
      },
    );
  }
}
