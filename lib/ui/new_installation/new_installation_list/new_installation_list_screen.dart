import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/core/services/cache_service.dart';
import 'package:flutter_base/ui/new_installation_and_repair_request_share/common_installation_list.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:get/get.dart';

import '../../../data/installation_api.dart';
import '../../../models/common/installation_list_payload.dart';
import '../../../models/common/installation_search_payload.dart';
import '../../../models/installation/installation_list_model_response.dart';
import '../../new_installation_and_repair_request_share/common_installation_list_controller.dart';
import '../new_installation_detail/new_installation_detail_controller.dart';
import '../new_installation_detail/new_installation_detail_screen.dart';
import 'new_installation_item.dart';

class NewInstallationListScreen extends StatefulWidget {
  const NewInstallationListScreen({super.key});

  @override
  State<NewInstallationListScreen> createState() =>
      _NewInstallationListScreenState();
}

class _NewInstallationListScreenState extends State<NewInstallationListScreen> {
  final _controller =
      CommonInstallationListController<InstallationListModelResponse>();

  Future<List<InstallationListModelResponse>> getData({int page = 1}) async {
    final body = InstallationListPayload(
      typeData: MBService.NewInstallation,
      searchDefault: InstallationSearchPayload(
        page: page,
        pageSize: 20,
        typeOrder: true,
      ),
    );

    final response = await Get.find<InstallationApi>()
        .getNewInstallationList(body)
        .callApi(isShowLoading: false);

    final data = response.data?.model;

    if (data != null) {
      return data;
    }

    return [];
  }

  Widget buildChild(InstallationListModelResponse item) {
    return NewInstallationItem(
      item: item,
      onTapViewDetail: () async {
        if (item.id == null) {
          MyDialog.snackbar('Không có ID');
          return;
        }

        CacheService().write(
          key: CacheService.isRefreshNewInstallationList,
          value: false,
        );

        await Get.to(
          () {
            return const NewInstallationDetailScreen();
          },
          binding: BindingsBuilder.put(() {
            return NewInstallationDetailController(newInstallationId: item.id!);
          }),
        );

        final isRefresh =
            CacheService().read<bool>(
              key: CacheService.isRefreshNewInstallationList,
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
      title: 'Danh sách lắp mới',
    );
  }
}
