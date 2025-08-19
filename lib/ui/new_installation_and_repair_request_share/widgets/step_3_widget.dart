import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/repair_request_api.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/widgets/file_collection/file_collection_widget.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:flutter_base/widgets/selector/selector_widget.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';
import 'package:get/get.dart';

import '../../../theme/styles.dart';
import '../../../widgets/file_collection/file_collection_controller.dart';
import '../../../widgets/selector/selector_controller.dart';

class Step3 extends StatelessWidget {
  final bool isViewOnly;
  final bool canSelectAccidents;
  final void Function() onPressed;
  final MyTextFieldController cableEndTextController;
  final MyTextFieldController step3NoteTextController;
  final MyTextFieldController cableStartTextController;
  final MySelectorController accidentsSelectorController;
  final FileCollectionController reportDividerImageControler;
  final FileCollectionController technicalStaffImageControler;
  final FileCollectionController reportCableEndImageControler;
  final FileCollectionController reportCableStartImageControler;
  final FileCollectionController technicalStaffTestImageControler;
  final FileCollectionController technicalStaffModuleImageControler;

  const Step3({
    super.key,
    required this.onPressed,
    this.isViewOnly = false,
    this.canSelectAccidents = false,
    required this.cableEndTextController,
    required this.step3NoteTextController,
    required this.cableStartTextController,
    required this.reportDividerImageControler,
    required this.accidentsSelectorController,
    required this.technicalStaffImageControler,
    required this.reportCableEndImageControler,
    required this.reportCableStartImageControler,
    required this.technicalStaffTestImageControler,
    required this.technicalStaffModuleImageControler,
  });

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: 'Thực hiện công việc',
      child: Column(
        children: [
          AppStyles.pdt10,
          Visibility(
            visible: canSelectAccidents,
            child: Padding(
              padding: const EdgeInsetsGeometry.only(bottom: 20),
              child: MySelector(
                title: 'Loại sự cố',
                isMultipleSelect: true,
                controller: accidentsSelectorController,
                data: MySelectorData(
                  cacheKey: 'AccidentList',
                  getFutureData: () async {
                    final response = await Get.find<RepairRequestApi>()
                        .getListAllAccident()
                        .callApi(
                          isShowLoading: false,
                          isShowSuccessMessage: false,
                        );
                    return (response.data ?? []).map((element) {
                      return MySelectorModel(
                        id: element.id,
                        name: element.text ?? '',
                      );
                    }).toList();
                  },
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MyTextField(
                  labelText: 'Đầu sợi cáp',
                  keyboardType: TextInputType.number,
                  controller: cableStartTextController,
                ),
              ),
              AppStyles.pdl10,
              Expanded(
                child: MyTextField(
                  labelText: 'Cuối sợi cáp',
                  keyboardType: TextInputType.number,
                  controller: cableEndTextController,
                ),
              ),
            ],
          ),
          AppStyles.pdt10,
          FileCollectionWidget(
            limit: 1,
            title: 'Ảnh module',
            isViewImageOnly: isViewOnly,
            controller: technicalStaffModuleImageControler,
          ),
          AppStyles.pdt10,
          FileCollectionWidget(
            limit: 1,
            title: 'Ảnh test tốc độ',
            isViewImageOnly: isViewOnly,
            controller: technicalStaffTestImageControler,
          ),
          AppStyles.pdt10,
          FileCollectionWidget(
            limit: 1,
            title: 'Ảnh tổng thể',
            isViewImageOnly: isViewOnly,
            controller: technicalStaffImageControler,
          ),
          AppStyles.pdt10,
          FileCollectionWidget(
            limit: 1,
            title: 'Ảnh bộ chia',
            isViewImageOnly: isViewOnly,
            controller: reportDividerImageControler,
          ),
          AppStyles.pdt10,
          FileCollectionWidget(
            limit: 1,
            title: 'Ảnh đầu sợi cáp',
            isViewImageOnly: isViewOnly,
            controller: reportCableStartImageControler,
          ),
          AppStyles.pdt10,
          FileCollectionWidget(
            limit: 1,
            title: 'Ảnh cuối sợi cáp',
            isViewImageOnly: isViewOnly,
            controller: reportCableEndImageControler,
          ),
          Visibility(
            visible: !isViewOnly,
            child: Column(
              children: [
                AppStyles.pdt25,
                MyTextField(
                  isRequired: true,
                  labelText: 'Báo cáo công việc',
                  controller: step3NoteTextController,
                ),
                AppStyles.pdt20,
                ElevatedButton(
                  onPressed: onPressed,
                  child: const Text('Cập nhật'),
                ),
                AppStyles.pdt15,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
