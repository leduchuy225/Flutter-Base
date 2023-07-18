import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String text;
  final Function()? onTab;

  const EmptyPage({
    super.key,
    this.onTab,
    this.text = 'Empty Page',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Center(
        child: InkWell(
          onTap: onTab,
          child: Text(text),
        ),
      ),
    );
  }
}
