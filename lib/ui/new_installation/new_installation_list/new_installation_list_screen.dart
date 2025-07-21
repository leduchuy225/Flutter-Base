import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/title_number_indicator.dart';
import 'package:get/get.dart';

import '../../../data/installation_api.dart';
import '../../../models/installation/installation_list_model_response.dart';
import '../../../models/installation/installation_list_payload.dart';
import '../../../widgets/data_state_widget.dart';
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
  List<InstallationListModelResponse> _data = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getData();
    });
  }

  Future getData() async {
    final response = await Get.find<InstallationApi>()
        .getNewInstallationList(InstallationListPayload())
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
        'Danh sách lắp mới',
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
                title: 'Yêu cầu lắp mới',
              ),
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
                child: NewInstallationItem(
                  item: item,
                  onTapViewDetail: () {
                    Get.to(
                      () {
                        return const NewInstallationDetailScreen();
                      },
                      binding: BindingsBuilder.put(() {
                        return NewInstallationDetailController();
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
