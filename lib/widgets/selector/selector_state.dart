import 'package:get/get.dart';

import '../../models/base_selector.dart';

class SelectorState extends GetxController {
  final MySelectorArguments? argument;
  final List<MySelectorModel> Function()? getStaticData;

  List<MySelectorModel> dataChoosen = [];

  final dataList = <MySelectorModel>[].obs;
  final title = 'BottomSheetSelectorTitlte'.obs;

  SelectorState({this.argument, this.getStaticData});

  @override
  void onInit() {
    super.onInit();
    dataList.value = _staticData;
  }

  List<MySelectorModel> get _staticData => getStaticData != null ? getStaticData!() : [];

  void updateTitleName(String name) {
    title.value = name;
  }

  void select(List<MySelectorModel> items) {
    dataChoosen = items;
  }
}
