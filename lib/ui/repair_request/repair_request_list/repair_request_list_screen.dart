import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/repair_request_api.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/search_field/search_field_widget.dart';
import 'package:flutter_base/widgets/title_number_indicator.dart';
import 'package:get/get.dart';

import '../../../models/installation/installation_list_payload.dart';
import '../../../models/repair_request/repair_request_list_model_response.dart';
import '../../../widgets/data_state_widget.dart';
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
  List<RepairRequestListModelResponse> _data = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getData();
    });
  }

  Future getData() async {
    final response = await Get.find<RepairRequestApi>()
        .getRepairRequestList(InstallationListPayload())
        .callApi();

    final data = response.data?.model;
    if (data != null) {
      setState(() {
        _data = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar(
        'Danh sách sửa chữa',
        action: IconButton(
          onPressed: getData,
          icon: const Icon(Icons.replay_outlined),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: AppStyles.horizontalPaddingValue,
              ),
              child: TitleNumberIndicator(
                number: _data.length,
                title: 'Yêu cầu sửa chữa',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsGeometry.only(
                top: 6,
                bottom: 12,
                left: AppStyles.horizontalPaddingValue,
                right: AppStyles.horizontalPaddingValue,
              ),
              child: MySearchField(onFiltered: (text) {}),
            ),
          ),
          SliverToBoxAdapter(
            child: Visibility(
              visible: _data.isEmpty,
              child: MyDataState.empty(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = _data[index];
              return Padding(
                padding: const EdgeInsetsGeometry.symmetric(
                  vertical: 10,
                  horizontal: AppStyles.horizontalPaddingValue,
                ),
                child: RepairRequestItem(
                  item: item,
                  onTapViewDetail: () {
                    Get.to(
                      () {
                        return const RepairRequestDetailScreen();
                      },
                      binding: BindingsBuilder.put(() {
                        return RepairRequestDetailController();
                      }),
                    );
                  },
                ),
              );
            }, childCount: _data.length),
          ),
        ],
      ),
    );
  }
}
