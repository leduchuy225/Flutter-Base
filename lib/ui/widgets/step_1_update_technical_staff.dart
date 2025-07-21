import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/installation_api.dart';
import 'package:flutter_base/widgets/selector/selector_widget.dart';
import 'package:get/get.dart';

import '../../models/base_selector.dart';
import '../../models/installation/technical_staff_list_payload.dart';
import '../../theme/styles.dart';
import '../../widgets/my_texttile.dart';
import '../../widgets/selector/selector_controller.dart';

class Step1UpdateTechnicalStaff extends StatelessWidget {
  final void Function() onPressed;
  final MySelectorController technicalStaffSelectController;

  const Step1UpdateTechnicalStaff({
    super.key,
    required this.onPressed,
    required this.technicalStaffSelectController,
  });

  @override
  Widget build(BuildContext context) {
    return MyTexttile.card(
      title: 'Giao việc',
      items: [
        MyTexttileItem(
          child: Column(
            children: [
              AppStyles.pdt15,
              MySelector(
                title: 'Nhân viên kĩ thuật',
                controller: technicalStaffSelectController,
                data: MySelectorData(
                  getFutureData: () async {
                    final response = await Get.find<InstallationApi>()
                        .getTechnicalStaffList(TechnicalStaffListPayload())
                        .callApi();

                    final data = response.data?.model ?? [];

                    return data.map((element) {
                      return MySelectorModel(
                        id: element.id,
                        name: element.email ?? '',
                        description: element.fullName,
                      );
                    }).toList();
                  },
                ),
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
    );
  }
}
