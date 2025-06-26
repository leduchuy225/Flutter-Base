import 'package:flutter/material.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/widgets/dialog/bottom_sheet_widget.dart';
import 'package:flutter_base/widgets/selector/selector_controller.dart';

import '../text_field/text_field_widget.dart';
import 'selector_content/bottomsheet_selector_content_widget.dart';

class MySelector extends StatefulWidget {
  final String title;
  final MySelectorData data;
  final MySelectorController? controller;

  const MySelector({
    Key? key,
    this.controller,
    required this.data,
    required this.title,
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
      onTap: () {
        MyBottomSheet.showDraggableScrollableSheet<List<MySelectorModel>>(
          context,
          builder: (context, scrollController) {
            return MyBottomsheetSelectorContent(
              data: widget.data,
              title: widget.title,
              controller: _mainController,
              scrollController: scrollController,
            );
          },
        );
      },
    );
  }
}
