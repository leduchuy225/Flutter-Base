import 'package:flutter/material.dart';

import '../../core/utils/diacritic/diacritic.dart';
import '../../theme/styles.dart';
import 'search_deboucer.dart';

class MySearchField extends StatefulWidget {
  final void Function(String text) onFiltered;

  const MySearchField({Key? key, required this.onFiltered}) : super(key: key);

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
    return TextField(
      onChanged: onSearchChanged,
      decoration: const InputDecoration(
        labelText: 'Nhập nội dung',
        fillColor: AppColors.textLight,
      ),
    );
  }
}

String _processText(dynamic text) {
  if (text == null || (text is! String && text is! num)) {
    return '';
  }
  return removeDiacritics(text.toString().trim()).toLowerCase();
}
