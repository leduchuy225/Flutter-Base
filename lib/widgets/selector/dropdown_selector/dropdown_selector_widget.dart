import 'package:flutter/material.dart';

class MyDropdownSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      items: const [
        DropdownMenuItem(value: 0, child: Text('0')),
        DropdownMenuItem(value: 1, child: Text('1')),
        DropdownMenuItem(value: 2, child: Text('2')),
      ],
      value: 1,
      onTap: () {
        print('On tap');
      },
      onChanged: (item) {},
    );
  }
}
