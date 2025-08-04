import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/models/base_response.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/title_number_indicator.dart';
import 'package:get/get.dart';

import '../data/jsonplaceholder_api.dart';
import '../models/base_selector.dart';
import '../models/file_collection_model.dart';
import '../widgets/datetime_picker/datetime_picker_widget.dart';
import '../widgets/dialog/dialog_widget.dart';
import '../widgets/file_collection/file_collection_controller.dart';
import '../widgets/file_collection/file_collection_widget.dart';
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
  final _fileCollectionController = FileCollectionController();

  @override
  void initState() {
    super.initState();

    _fileCollectionController.files.value = [
      const FileCollectionModel(
        fileName: 'TEST',
        isLocal: false,
        filePath:
            'https://bowseat.org/wp-content/uploads/2023/07/chihiro045.jpeg',
      ),
      const FileCollectionModel(
        fileName: 'TEST2',
        isLocal: false,
        filePath: '',
      ),
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // final data = await Get.find<JsonPlaceholderApi>().getPostDetail();
      // MyDialog.snackbar(data.data.toString());

      // await readJsoncFile('.json_models/installation_models.jsonc');
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
            FutureBuilder(
              future: Config().deviceToken,
              builder: (context, asyncSnapshot) {
                return MyTexttile(
                  isShowCopyIcon: true,
                  text: asyncSnapshot.data,
                );
              },
            ),
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
                    .getPostDetail()
                    .then((value) {
                      return BaseResponse();
                    })
                    .callApi(
                      mockData: BaseResponse(
                        data: 'AHIHI',
                        code: MyStatus.success,
                      ),
                    );
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
                  // return Get.find<JsonPlaceholderApi>()
                  //     .getPostList()
                  //     .callApi()
                  //     .then((value) {
                  //       return (value.data ?? []).map((element) {
                  //         return MySelectorModel(
                  //           id: element['id'],
                  //           name: element['title'],
                  //         );
                  //       }).toList();
                  //     });
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
            AppStyles.pdt20,
            MyTexttile.card(
              title: 'My love',
              paddingHeader: const EdgeInsets.symmetric(horizontal: 8),
              suffixHeader: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              items: [
                MyTexttileItem(titleText: 'Họ và tên', text: 'Sủi'),
                MyTexttileItem(titleText: 'Ngày sinh', text: '02/01/2000'),
                MyTexttileItem(
                  titleText: 'SĐT',
                  text: '+84944718451',
                  isPhoneNumber: true,
                ),
              ],
            ),
            AppStyles.pdt20,
            const TitleNumberIndicator(title: 'Tôi nhớ em', number: 1000),
            AppStyles.pdt20,
            const Row(
              children: [
                Expanded(flex: 2, child: DatetimePicker(title: 'Chọn ngày')),
                AppStyles.pdl5,
                Expanded(
                  flex: 1,
                  child: DatetimePicker(
                    isTimePicker: true,
                    title: 'Chọn thời gian',
                  ),
                ),
              ],
            ),

            AppStyles.pdt20,
            const DatetimePicker(title: 'Chọn khoảng', isDateRangePicker: true),
            AppStyles.pdt20,
            const DatetimePicker(title: 'Chọn thời gian', isTimePicker: true),
            AppStyles.pdt20,
            FileCollectionWidget(controller: _fileCollectionController),
            AppStyles.pdt20,
          ],
        ),
      ),
    );
  }
}
