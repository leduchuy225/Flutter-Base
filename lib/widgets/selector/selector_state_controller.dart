import 'package:get/get.dart';

import '../../models/base_selector.dart';

class SelectorStateController extends GetxController {
  final MySelectorArguments? argument;
  final List<MySelectorModel> Function()? getStaticData;

  final dataList = <MySelectorModel>[].obs;
  final title = 'BottomSheetSelectorTitlte'.obs;

  SelectorStateController({this.argument, this.getStaticData});

  @override
  void onInit() {
    super.onInit();
    dataList.value = staticData;
  }

  List<MySelectorModel> get staticData => getStaticData != null ? getStaticData!() : [];

  void updateTitleName(String name) {
    title.value = name;
  }
}
