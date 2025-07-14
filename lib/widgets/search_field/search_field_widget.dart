import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';

import '../../core/utils/diacritic/diacritic.dart';
import '../text_field/text_field_controller.dart';
import 'search_deboucer.dart';

class MySearchField extends StatefulWidget {
  final MyTextFieldController? controller;
  final void Function(String text) onFiltered;

  const MySearchField({Key? key, required this.onFiltered, this.controller})
    : super(key: key);

  @override
  State<MySearchField> createState() => _MySearchFieldState();

  static bool isTextContainInList(String text, List<dynamic> list) {
    if (text.trim().isEmpty) {
      return true;
    }
    return list
        .map((e) {
          return _processText(e);
        })
        .any((element) {
          return element.contains(_processText(text));
        });
  }
}

class _MySearchFieldState extends State<MySearchField> {
  final _debouncer = MyDebouncer(delay: const Duration(milliseconds: 800));

  void onSearchChanged(String query) {
    _debouncer(() {
      widget.onFiltered(query);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debouncer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      onChanged: onSearchChanged,
      hintText: 'Nội dung tìm kiếm',
      controller: widget.controller,
    );
  }
}

String _processText(dynamic text) {
  if (text == null || (text is! String && text is! num)) {
    return '';
  }
  return removeDiacritics(text.toString().trim()).toLowerCase();
}
