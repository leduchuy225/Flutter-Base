import 'package:flutter/material.dart';

import '../widgets/my_texttile.dart';

class DevScreen extends StatefulWidget {
  const DevScreen({super.key});

  @override
  State<DevScreen> createState() => _DevScreenState();
}

class _DevScreenState extends State<DevScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            MyTexttile(
              titleText: 'TEST',
              text: 'TEST',
              orientation: MyTexttileOrientation.VERTICAL,
            ),
            MyTexttile(
              text: 'TEST',
              titleText: 'TEST',
              orientation: MyTexttileOrientation.HORIZONTAL,
            ),
          ],
        ),
      ),
    );
  }
}
