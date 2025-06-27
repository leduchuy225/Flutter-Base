import 'package:collection/collection.dart';
import 'package:flutter_base/core/services/cache_service.dart';
import 'package:get/get.dart';

import '../../models/base_selector.dart';
import '../search_field/search_field_widget.dart';
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
  final String? cacheKey;
  final Future<List<MySelectorModel>> Function() getFutureData;

  MySelectorData({required this.getFutureData, this.cacheKey});

  List<MySelectorModel> _dataListDefault = [];

  final isLoading = true.obs;
  final dataListShow = <MySelectorModel>[].obs;

  Future<void> updateDataList() async {
    isLoading.value = true;

    if (cacheKey != null) {
      final cacheService = CacheService();
      final data = cacheService.read<List<MySelectorModel>>(key: cacheKey!);
      if (data == null) {
        _dataListDefault = await getFutureData();
        cacheService.write(key: cacheKey!, value: _dataListDefault);
      } else {
        _dataListDefault = data;
      }
      dataListShow.value = _dataListDefault;
    } else {
      _dataListDefault = await getFutureData();
      dataListShow.value = _dataListDefault;
    }

    isLoading.value = false;
  }

  void searchInList(String text) {
    if (text.isEmpty) {
      dataListShow.value = _dataListDefault;
      return;
    }
    dataListShow.value = _dataListDefault.where((element) {
      return MySearchField.isTextContainInList(text, [
        element.name,
        element.description,
      ]);
    }).toList();
  }
}
