import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:get/get.dart';

import '../../../data/installation_api.dart';
import '../../../models/installation/installation_detail_model_response.dart';
import '../../../models/installation/installation_detail_payload.dart';

class NewInstallationDetailController extends GetxController {
  final currentStep = RxInt(0);
  final _detailData = Rx<InstallationDetailModelResponse?>(null);

  InstallationDetailModelResponse? get detailData => _detailData.value;

  Future getDetailData() async {
    final body = InstallationDetailPayload();
    final response = await Get.find<InstallationApi>()
        .getNewInstallationDetail(body)
        .callApi();

    final data = response.data?.model;

    if (data != null) {
      _detailData.value = data;
      currentStep.value = data.currentStep ?? 0;

      update();
    }
  }
}
