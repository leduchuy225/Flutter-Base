import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/repair_request_api.dart';
import 'package:get/get.dart';

import '../../../core/const/constants.dart';
import '../../../core/services/cache_service.dart';
import '../../../models/common/installation_list_payload.dart';
import '../../../models/common/installation_search_payload.dart';
import '../../../models/repair_request/repair_request_list_model_response.dart';
import '../../../widgets/dialog/dialog_widget.dart';
import '../../new_installation_and_repair_request_share/common_installation_list_controller.dart';
import '../../new_installation_and_repair_request_share/common_installation_list_screen.dart';
import '../repair_request_detail/repair_request_detail_controller.dart';
import '../repair_request_detail/repair_request_detail_screen.dart';
import 'repair_request_item.dart';

class RepairRequestListScreen extends StatefulWidget {
  const RepairRequestListScreen({super.key});

  @override
  State<RepairRequestListScreen> createState() =>
      _NewInstallationListScreenState();
}

class _NewInstallationListScreenState extends State<RepairRequestListScreen> {
  final _controller =
      CommonInstallationListController<RepairRequestListModelResponse>();

  Future<List<RepairRequestListModelResponse>> getData({int page = 1}) async {
    final body = InstallationListPayload(
      coundLoad: 1,
      typeData: MBService.NewInstallation,
      searchDefault: InstallationSearchPayload(
        page: page,
        pageSize: 20,
        typeOrder: true,
      ),
    );

    final response = await Get.find<RepairRequestApi>()
        .getRepairRequestList(body)
        .callApi(isShowLoading: false, isShowSuccessMessage: false);

    final data = response.data?.model;

    if (data != null) {
      return data;
    }

    return [];
  }

  Widget buildChild(RepairRequestListModelResponse item) {
    return RepairRequestItem(
      item: item,
      onTapViewDetail: () async {
        if (item.id == null) {
          MyDialog.snackbar('Không có ID');
          return;
        }

        CacheService().write(
          key: CacheService.isRefreshRepairRequestList,
          value: false,
        );

        await Get.to(
          () {
            return const RepairRequestDetailScreen();
          },
          binding: BindingsBuilder.put(() {
            return RepairRequestDetailController(repairRequestId: item.id!);
          }),
        );

        final isRefresh =
            CacheService().read<bool>(
              key: CacheService.isRefreshRepairRequestList,
            ) ??
            false;

        if (isRefresh) {
          _controller.reset();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonInstallationListScreen(
      getData: getData,
      buildChild: buildChild,
      controller: _controller,
      title: 'Yêu cầu sửa chữa',
    );
  }
}
