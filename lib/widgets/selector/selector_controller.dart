import 'package:collection/collection.dart';
import 'package:get/get.dart';

import '../../models/base_selector.dart';
import '../text_field/text_field_controller.dart';

class MySelectorController extends MyTextFieldController {
  List<MySelectorModel> _selectors = [];

  set selectors(List<MySelectorModel> selectors) {
    _selectors = selectors;
    text = selectors
        .map((element) {
          return element.name;
        })
        .join('\n');
  }

  List<MySelectorModel> get selectors {
    return _selectors;
  }

  MySelectorModel? get first {
    return _selectors.firstOrNull;
  }
}

class MySelectorData extends GetxController {
  final Future<List<MySelectorModel>> Function() getFutureData;

  MySelectorData({required this.getFutureData});

  List<MySelectorModel> _dataListDefault = [];

  final isLoading = true.obs;
  final dataListShow = <MySelectorModel>[].obs;

  Future<void> updateDataList() async {
    isLoading.value = true;

    _dataListDefault = await getFutureData();
    dataListShow.value = _dataListDefault;

    isLoading.value = false;
  }

  void searchInList(String text) {
    if (text.isEmpty) {
      dataListShow.value = _dataListDefault;
      return;
    }
    dataListShow.value = _dataListDefault.where((element) {
      return '${element.name} ${element.description ?? ''}'.contains(text);
    }).toList();
  }
}
