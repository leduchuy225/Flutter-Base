import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';

import '../models/base_selector.dart';
import '../widgets/my_appbar.dart';
import '../widgets/my_texttile.dart';
import '../widgets/selector/selector_controller.dart';
import '../widgets/selector/selector_widget.dart';

class DevScreen extends StatefulWidget {
  const DevScreen({super.key});

  @override
  State<DevScreen> createState() => _DevScreenState();
}

class _DevScreenState extends State<DevScreen> {
  final _mySelectorController = MySelectorController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((data) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar('DEV'),
      body: SingleChildScrollView(
        padding: AppStyles.horizontalPadding,
        child: Column(
          children: [
            const MyTexttile(
              titleText: 'TEST',
              text: 'TEST',
              orientation: MyTexttileOrientation.VERTICAL,
            ),
            const MyTexttile(
              text: 'TEST',
              titleText: 'TEST',
              orientation: MyTexttileOrientation.HORIZONTAL,
            ),
            AppStyles.pdt15,
            MySelector(
              title: 'TEST',
              controller: _mySelectorController,
              data: MySelectorData(
                getFutureData: () {
                  return Future.value([
                    MySelectorModel(id: 1, name: 'Option 1'),
                    MySelectorModel(
                      id: 2,
                      name:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                    ),
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
