import 'package:collection/collection.dart';
import 'package:flutter_base/core/services/cache_service.dart';
import 'package:get/get.dart';

import '../../models/base_selector.dart';
import '../search_field/search_field_widget.dart';
import '../text_field/text_field_controller.dart';

class MySelectorController extends MyTextFieldController {
  final bool isNameWithDescription;

  List<MySelectorModel> _selectors = [];
  void Function(List<MySelectorModel>)? _onChanged;

  MySelectorController({this.isNameWithDescription = false});

  set onChanged(void Function(List<MySelectorModel>)? onChangedFunction) {
    _onChanged = onChangedFunction;
  }

  set selectors(List<MySelectorModel> selectors) {
    _selectors = selectors;

    final isDotAtStart = selectors.length > 1;
    text = selectors
        .map((element) {
          return '${isDotAtStart ? '•' : ''}  ${element.name} ${isNameWithDescription ? '- ${element.description}' : ''}'
              .trim();
        })
        .join('\n');

    if (_onChanged != null) {
      _onChanged!(_selectors);
    }
  }

  List<MySelectorModel> get selectors {
    return _selectors;
  }

  MySelectorModel? get first {
    return _selectors.firstOrNull;
  }

  @override
  void clear() {
    selectors = [];
  }

  bool get isEmpty {
    return _selectors.isNotEmpty;
  }
}

class MySelectorData extends GetxController {
  final List? excludeIds;
  final String? cacheKey;
  final Future<List<MySelectorModel>> Function() getFutureData;

  MySelectorData({required this.getFutureData, this.cacheKey, this.excludeIds});

  List<MySelectorModel> _dataListDefault = [];

  final isLoading = true.obs;
  final dataListShow = <MySelectorModel>[].obs;

  Future setDefaultData(
    Future<List<MySelectorModel>> Function() getFutureData,
  ) async {
    _dataListDefault = await getFutureData().then((value) {
      if (excludeIds == null) {
        return value;
      }
      return value.where((item) {
        return !(excludeIds ?? []).contains(item.id);
      }).toList();
    });
  }

  Future<void> updateDataList() async {
    isLoading.value = true;

    if (cacheKey != null) {
      final cacheService = CacheService();
      final data = cacheService.read<List<MySelectorModel>>(key: cacheKey!);
      if (data == null) {
        await setDefaultData(getFutureData);
        cacheService.write(key: cacheKey!, value: _dataListDefault);
      } else {
        await setDefaultData(() => Future.value(data));
      }
      dataListShow.value = _dataListDefault;
    } else {
      await setDefaultData(getFutureData);
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
