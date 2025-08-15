import 'package:get/get.dart';

import '../../../../models/installation/material_list_model_response.dart';

class MaterialSelectorController extends GetxController {
  final List<MaterialListModelResponse>? defaultMaterials;

  MaterialSelectorController({this.defaultMaterials}) {
    _materialListObs.value = defaultMaterials ?? [];
  }

  final _materialListObs = <MaterialListModelResponse>[].obs;

  List<MaterialListModelResponse> get materialList => _materialListObs;

  void add(MaterialListModelResponse data) {
    _materialListObs.add(data);
    update();
  }

  void remove(MaterialListModelResponse data) {
    _materialListObs.value = _materialListObs.where((material) {
      return material.materialId != data.materialId;
    }).toList();
    update();
  }
}
