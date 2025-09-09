import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/bo_chia_api.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:get/get.dart';

import '../../models/bo_chia/divider_view_used_port_model_response.dart';
import '../../theme/styles.dart';
import '../../widgets/dialog/dialog_widget.dart';

class DividerUsedPortDialog extends StatefulWidget {
  final int id;

  const DividerUsedPortDialog({super.key, required this.id});

  @override
  State<DividerUsedPortDialog> createState() => _DividerUsedPortDialogState();

  static void openDialog({int? id}) {
    if (id == null) {
      MyDialog.snackbar('Không đủ thông tin', type: SnackbarType.WARNING);
      return;
    }
    MyDialog.alertDialog(
      title: 'Danh sách cổng',
      buttonPadding: EdgeInsets.zero,
      content: DividerUsedPortDialog(id: id),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      actions: [
        TextButton(
          child: const Text('Đóng'),
          onPressed: () {
            if (Get.isDialogOpen == true) {
              Get.back();
            }
          },
        ),
      ],
    );
  }
}

class _DividerUsedPortDialogState extends State<DividerUsedPortDialog> {
  List<DividerViewUsedPortModelResponse> _portList = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final response = await Get.find<BoChiaApi>()
          .getDividerUsedPortList({'id': widget.id})
          .callApi(isShowSuccessMessage: false);

      final data = response.data?.model;
      if (data != null) {
        setState(() {
          _portList = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _portList.length,
      itemBuilder: (context, index) {
        final item = _portList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: MyTexttile.card(
            isHideIfTextNull: true,
            title: 'Cổng ${item.port}',
            tag: item.status == 1 ? 'Đã dùng' : 'Chưa sử dụng',
            tagColor: item.status == 1 ? AppColors.error : AppColors.success,
            items: [
              MyTexttileItem(
                titleText: 'Mã yêu cầu',
                text: item.listUsedPortModel
                    ?.map((port) => port.idLong)
                    .join('\n'),
              ),
            ],
          ),
        );
      },
    );
  }
}
