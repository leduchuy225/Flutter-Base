import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:get/get.dart';

import '../data/jsonplaceholder/jsonplaceholder_api.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((data) async {
      // final data = await Get.find<JsonPlaceholderApi>().getPostDetail();
      // MyDialog.snackbar(data.data.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar('DEV'),
      body: SingleChildScrollView(
        padding: AppStyles.horizontalPadding,
        child: Column(
          children: [
            AppStyles.pdt20,
            const MyTexttile(
              titleText: 'TEST',
              text: 'TEST',
              orientation: MyTexttileOrientation.VERTICAL,
            ),
            AppStyles.pdt20,
            const MyTexttile(
              text: 'TEST',
              titleText: 'TEST',
              orientation: MyTexttileOrientation.HORIZONTAL,
            ),
            AppStyles.pdt20,
            ElevatedButton(
              onPressed: () async {
                final data = await Get.find<JsonPlaceholderApi>()
                    .getPostDetail();
                if (data.data != null) {
                  MyDialog.snackbar(data.data.toString());
                }
              },
              child: const Text('TEST API'),
            ),
            AppStyles.pdt20,
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
