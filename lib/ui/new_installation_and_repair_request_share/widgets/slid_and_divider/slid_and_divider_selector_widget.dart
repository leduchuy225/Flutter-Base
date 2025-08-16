import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/installation_api.dart';
import 'package:flutter_base/data/olt_api.dart';
import 'package:flutter_base/data/pon_id_api.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:flutter_base/widgets/selector/selector_widget.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';
import 'package:get/get.dart';

import '../../../../models/base_selector.dart';
import '../../../../models/installation/slid_list_and_divider_list_model_payload.dart';
import '../../../../models/installation/slid_list_and_divider_list_payload.dart';
import '../../../../models/installation/slid_list_and_divider_list_response.dart';
import '../../../../models/installation/update_device_model_payload.dart';
import '../../../../models/installation/update_device_payload.dart';
import '../../../../models/installation/update_device_response.dart';
import '../../../../widgets/selector/selector_controller.dart';

class SlidAndDividerSelectorWidget extends StatefulWidget {
  final int id;
  final int countryId;
  final int provinceId;
  final UpdateDeviceResponse? defaultData;

  const SlidAndDividerSelectorWidget({
    super.key,
    required this.id,
    this.defaultData,
    required this.countryId,
    required this.provinceId,
  });

  static Future<UpdateDeviceResponse?> openDialog({
    int? id,
    int? countryId,
    int? provinceId,
    UpdateDeviceResponse? defaultData,
  }) {
    if (provinceId == null || countryId == null || id == null) {
      MyDialog.snackbar('Không đủ thông tin', type: SnackbarType.WARNING);
      return Future.value(null);
    }
    return MyDialog.alertDialog(
      actions: [],
      title: 'Nhập thiết bị',
      buttonPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      content: SlidAndDividerSelectorWidget(
        id: id,
        countryId: countryId,
        provinceId: provinceId,
        defaultData: defaultData,
      ),
    );
  }

  @override
  State<SlidAndDividerSelectorWidget> createState() =>
      _SlidAndDividerSelectorWidgetState();
}

class _SlidAndDividerSelectorWidgetState
    extends State<SlidAndDividerSelectorWidget> {
  final _oltSelectorController = MySelectorController();
  final _ponIdSelectorController = MySelectorController();
  final _slidSelectorController = MySelectorController();
  final _dividerSelectorController = MySelectorController();
  final _portSelectorController = MySelectorController();
  final _accTextController = MyTextFieldController();
  final _passTextController = MyTextFieldController();

  SlidListAndDividerListResponse? _slidAndDividerData;

  @override
  void initState() {
    super.initState();

    _oltSelectorController.onChanged = (data) {
      _ponIdSelectorController.clear();
    };
    _ponIdSelectorController.onChanged = (data) {
      _slidAndDividerData = null;

      _slidSelectorController.clear();
      _dividerSelectorController.clear();
    };

    _dividerSelectorController.onChanged = (data) {
      _ponIdSelectorController.clear();
    };
  }

  Future<SlidListAndDividerListResponse?> getSlidAndDividerData() async {
    if (_slidAndDividerData == null) {
      final body = SlidListAndDividerListPayload(
        id: widget.id,
        model: SlidListAndDividerListModelPayload(
          countryId: widget.countryId,
          provinceId: widget.provinceId,
          oltId: _oltSelectorController.first?.id,
          ponidId: _ponIdSelectorController.first?.id,
        ),
      );
      final response = await Get.find<InstallationApi>()
          .getUpdateDevice(body)
          .callApi(isShowLoading: false, isShowSuccessMessage: false);
      _slidAndDividerData = response.data;
    }

    return _slidAndDividerData;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppStyles.pdt15,
                  MySelector(
                    title: 'OLT',
                    controller: _oltSelectorController,
                    data: MySelectorData(
                      getFutureData: () async {
                        final body = {'ProvinceID': widget.provinceId};
                        final response = await Get.find<OltApi>()
                            .getOltByProvince(body)
                            .callApi(
                              isShowLoading: false,
                              isShowSuccessMessage: false,
                            );
                        return (response.data?.olt ?? []).map((olt) {
                          return MySelectorModel(
                            id: olt.id,
                            name: olt.code!,
                            extraData: {'oltIdLong': olt.idLong},
                          );
                        }).toList();
                      },
                    ),
                  ),
                  AppStyles.pdt15,
                  MySelector(
                    title: 'PON ID',
                    controller: _ponIdSelectorController,
                    onBeginSelect: (controller) {
                      if (!_oltSelectorController.checkIsNotEmpty()) {
                        return false;
                      }
                      return true;
                    },
                    data: MySelectorData(
                      getFutureData: () async {
                        final body = {
                          'oLT_ID': _oltSelectorController.first?.id,
                        };
                        final response = await Get.find<PonIdApi>()
                            .getPonIdByOltId(body)
                            .callApi(
                              isShowLoading: false,
                              isShowSuccessMessage: false,
                            );
                        return (response.data?.pOnid ?? []).map((pon) {
                          return MySelectorModel(
                            id: pon.id,
                            name: pon.code!,
                            extraData: {'ponidIdLong': pon.idLong},
                          );
                        }).toList();
                      },
                    ),
                  ),
                  AppStyles.pdt15,
                  MySelector(
                    title: 'SLID',
                    controller: _slidSelectorController,
                    onBeginSelect: (controller) {
                      if (!_ponIdSelectorController.checkIsNotEmpty()) {
                        return false;
                      }
                      return true;
                    },
                    data: MySelectorData(
                      getFutureData: () async {
                        final data = await getSlidAndDividerData();
                        return (data?.listSlid ?? []).map((slid) {
                          return MySelectorModel(
                            id: slid.id,
                            name: slid.code!,
                            extraData: {
                              'status': slid.status,
                              'slidIdLong': slid.idLong,
                            },
                          );
                        }).toList();
                      },
                    ),
                  ),
                  AppStyles.pdt15,
                  MySelector(
                    title: 'Bộ chia',
                    controller: _dividerSelectorController,
                    onBeginSelect: (controller) {
                      if (!_ponIdSelectorController.checkIsNotEmpty()) {
                        return false;
                      }
                      return true;
                    },
                    data: MySelectorData(
                      getFutureData: () async {
                        final data = await getSlidAndDividerData();
                        return (data?.listDivider ?? []).map((divider) {
                          return MySelectorModel(
                            id: divider.id,
                            name: divider.code!,
                            description: 'Cổng tối đa: ${divider.maxPort}',
                            extraData: {
                              'maxPort': divider.maxPort ?? 0,
                              'dividerIdLong': divider.idLong,
                            },
                          );
                        }).toList();
                      },
                    ),
                  ),
                  AppStyles.pdt15,
                  MySelector(
                    title: 'Port',
                    controller: _portSelectorController,
                    onBeginSelect: (controller) {
                      if (!_dividerSelectorController.checkIsNotEmpty()) {
                        return false;
                      }
                      return true;
                    },
                    data: MySelectorData(
                      getFutureData: () async {
                        final maxPort = _dividerSelectorController
                            .first
                            ?.extraData?['maxPort'];

                        return List<MySelectorModel>.generate(maxPort, (i) {
                          return MySelectorModel(
                            id: i + 1,
                            name: (i + 1).toString(),
                          );
                        });
                      },
                    ),
                  ),
                  AppStyles.pdt15,
                  MyTextField(
                    labelText: 'Account',
                    controller: _accTextController,
                  ),
                  AppStyles.pdt15,
                  MyTextField(
                    labelText: 'Password',
                    controller: _passTextController,
                  ),
                ],
              ),
            ),
          ),
        ),
        AppStyles.pdt20,
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Text('Hủy'),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            AppStyles.pdl10,
            Expanded(
              child: ElevatedButton(
                child: const Text('Cập nhật'),
                onPressed: () {
                  MyDialog.alertDialog(
                    message: 'Xác nhận cập nhật thông tin thiết bị ?',
                    okHandler: () async {
                      final body = UpdateDevicePayload(
                        id: widget.id,
                        model: UpdateDeviceModelPayload(
                          countryId: widget.countryId,
                          provinceId: widget.provinceId,
                          deviceAcc: _accTextController.textTrim,
                          devicePass: _passTextController.textTrim,
                          oltId: _oltSelectorController.first?.id,
                          ponidId: _ponIdSelectorController.first?.id,
                          devicePort: _portSelectorController.first?.id,
                          deviceStatus:
                              _slidSelectorController
                                      .first
                                      ?.extraData?['status'] ==
                                  true
                              ? 1
                              : 0,
                          dividerIdLong: _dividerSelectorController
                              .first
                              ?.extraData?['dividerIdLong'],
                          oltIdLong: _oltSelectorController
                              .first
                              ?.extraData?['oltIdLong'],
                          ponidIdLong: _ponIdSelectorController
                              .first
                              ?.extraData?['ponidIdLong'],
                          slidIdLong: _slidSelectorController
                              .first
                              ?.extraData?['slidIdLong'],
                        ),
                      );
                      final response = await Get.find<InstallationApi>()
                          .updateDevice(body)
                          .callApi(
                            isShowErrorMessage: false,
                            isShowSuccessMessage: false,
                          );

                      if (response.isSuccess) {
                        Get.back(result: response.data);
                      }

                      MyDialog.snackbar(
                        response.message,
                        type: response.isSuccess
                            ? SnackbarType.SUCCESS
                            : SnackbarType.ERROR,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
