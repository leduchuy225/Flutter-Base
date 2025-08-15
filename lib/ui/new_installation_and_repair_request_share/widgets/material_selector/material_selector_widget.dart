import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/core/utils/utils.dart';
import 'package:flutter_base/data/material_api.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:flutter_base/widgets/selector/selector_controller.dart';
import 'package:flutter_base/widgets/selector/selector_widget.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';
import 'package:get/get.dart';

import '../../../../models/base_selector.dart';
import '../../../../models/installation/material_list_model_response.dart';
import '../../../../models/installation/update_material_model_payload.dart';
import '../../../../models/installation/update_material_payload.dart';
import '../../../../widgets/text_field/text_field_controller.dart';
import 'material_selector_controller.dart';

class MaterialSelectorWidget extends StatefulWidget {
  final int id;
  final MaterialSelectorController controller;
  final Future Function() deleteMaterialApi;
  final Future Function(UpdateMaterialPayload) updateMaterialApi;

  const MaterialSelectorWidget({
    super.key,
    required this.id,
    required this.controller,
    required this.deleteMaterialApi,
    required this.updateMaterialApi,
  });

  @override
  State<MaterialSelectorWidget> createState() => _MaterialSelectorWidgetState();
}

class _MaterialSelectorWidgetState extends State<MaterialSelectorWidget> {
  final materialSeletorController = MySelectorController(
    isNameWithDescription: true,
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: 'Vật tư',
      child: GetBuilder(
        init: widget.controller,
        builder: (controller) {
          return Column(
            children: [
              AppStyles.pdt15,
              MySelector(
                title: 'Danh sách vật tư',
                controller: materialSeletorController,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add_circle, color: AppColors.black),
                  onPressed: () {
                    if (materialSeletorController.checkIsNotEmpty()) {
                      final item = materialSeletorController.first;
                      controller.add(
                        MaterialListModelResponse(
                          materialId: item?.id,
                          materialTitle: item?.name,
                          unitIdTitle: item?.description,
                        ),
                      );
                      materialSeletorController.clear();
                    }
                  },
                ),
                data: MySelectorData(
                  cacheKey: 'MaterialList',
                  excludeIds: controller.materialList.map((material) {
                    return material.materialId;
                  }).toList(),
                  getFutureData: () async {
                    final response = await Get.find<MaterialApi>()
                        .getMaterialList()
                        .callApi(
                          isShowLoading: false,
                          isShowSuccessMessage: false,
                        );
                    return (response.data?.material ?? []).map((element) {
                      return MySelectorModel(
                        id: element.id,
                        name: element.title ?? '',
                        description: element.unitIdTitle,
                      );
                    }).toList();
                  },
                ),
              ),
              AppStyles.pdt10,
              ...controller.materialList.map((material) {
                final textController = MyTextFieldController();
                if (material.quantity != null) {
                  textController.text = material.quantity.toString();
                }
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            controller.remove(material);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(material.materialTitle ?? ''),
                            Text(
                              material.unitIdTitle ?? '',
                              style: AppTextStyles.body2.copyWith(
                                color: AppColors.textGrey2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsetsGeometry.all(8),
                          child: MyTextField(
                            hintText: 'SL',
                            controller: textController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            onChanged: (text) {
                              controller.materialList.forEach((materialItem) {
                                if (materialItem.materialId ==
                                    material.materialId) {
                                  materialItem.quantity = getNullOrNumber(
                                    text.trim(),
                                  );
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              AppStyles.pdt10,
              ElevatedButton(
                child: const Text('Cập nhật'),
                onPressed: () {
                  MyDialog.alertDialog(
                    message: 'Xác nhận muốn cập nhật số lượng vật tư ?',
                    okHandler: () {
                      final body = UpdateMaterialPayload(
                        id: widget.id,
                        model: controller.materialList.map((material) {
                          return UpdateMaterialModelPayload(
                            id: material.id,
                            materialId: material.materialId,
                            quantity: material.quantity ?? 0,
                          );
                        }).toList(),
                      );
                      print(body.toJson());
                      // Get.find<InstallationApi>()
                      //     .updateMaterial(body)
                      //     .callApi();
                    },
                  );
                },
              ),
              AppStyles.pdt15,
            ],
          );
        },
      ),
    );
  }
}
