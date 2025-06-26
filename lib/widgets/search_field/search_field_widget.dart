import 'package:flutter/material.dart';

import '../../theme/styles.dart';
import 'search_deboucer.dart';

class MySearchField extends StatefulWidget {
  final void Function(String text) onFiltered;

  const MySearchField({Key? key, required this.onFiltered}) : super(key: key);

  @override
  State<MySearchField> createState() => _MySearchFieldState();
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
