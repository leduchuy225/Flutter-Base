import 'package:get/get.dart';

import '../../models/base_selector.dart';

class SelectorState extends GetxController {
  final MySelectorArguments? argument;
  final List<MySelectorModel> Function()? getStaticData;

  List<MySelectorModel> dataChoosen = [];

  final isLoading = true.obs;
  final dataList = <MySelectorModel>[].obs;
  final title = 'BottomSheetSelectorTitlte'.obs;

  SelectorState({this.argument, this.getStaticData});

  void updateTitleName(String name) {
    title.value = name;
  }

  void select(List<MySelectorModel> items) {
    dataChoosen = items;
  }

  Future<void> updateDataList() async {
    isLoading.value = true;
    dataList.value = await _getData();
    isLoading.value = false;
  }

  Future<List<MySelectorModel>> _getData() async {
    if (argument != null) {
      return argument!.apiSource!();
    }
    if (getStaticData != null) {
      return Future.value(getStaticData!());
    }
    return Future.value([]);
  }
}
