import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/ui/widgets/request_cancellation_widget.dart';
import 'package:flutter_base/widgets/dialog/bottom_sheet_widget.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:get/get.dart';

import '../../../widgets/dialog/dialog_widget.dart';
import '../../../widgets/my_tag_widget.dart';
import 'common_installation_detail_controller.dart';
import 'common_installation_note.dart';

class CommonInstallationDetailScreen<
  T extends CommonInstallationDetailController
>
    extends StatelessWidget {
  final String title;
  final T controller;
  final Widget Function(BuildContext, T) buildInformationChild;

  const CommonInstallationDetailScreen({
    super.key,
    required this.title,
    required this.controller,
    required this.buildInformationChild,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.notes),
        onPressed: () {
          MyBottomSheet.showDraggableScrollableSheet(
            context,
            builder: (context, scrollController) {
              return GetBuilder(
                init: controller,
                builder: (controller) {
                  return CommonInstallationNote(
                    canAddNote: true,
                    onPressed: controller.addNote,
                    notes: controller.noteListRxData,
                    scrollController: scrollController,
                    noteTextController: controller.noteTextController,
                  );
                },
              );
            },
          );
        },
      ),
      appBar: MyAppbar.appBar(
        'Chi tiết lắp đặt mới',
        action: IconButton(
          icon: const Icon(Icons.cancel_outlined),
          onPressed: () {
            MyBottomSheet.showBottomSheet(
              context,
              builder: (context) {
                return RequestCancellation(
                  closeNoteTextController: controller.closeNoteTextController,
                  onPressed: () {
                    if (controller.id == null) {
                      return;
                    }
                    if (!controller.closeNoteTextController.checkIsNotEmpty()) {
                      return;
                    }
                    MyDialog.alertDialog(
                      message: 'Xác nhận đóng phiếu ?',
                      okHandler: () {
                        controller.closeRequest(context);
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.horizontalPadding,
        child: GetBuilder(
          init: controller,
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppStyles.pdt15,
                Text('Thông tin chung', style: AppTextStyles.title1),
                AppStyles.pdt15,
                buildInformationChild(context, controller),
                AppStyles.pdt15,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Tiến độ công việc',
                        style: AppTextStyles.title1,
                      ),
                    ),
                    MyTag(text: 'Bước ${controller.currentRxStep}'),
                  ],
                ),
                AppStyles.pdt15,
                controller.buildSteps(context),
                AppStyles.pdt50,
              ],
            );
          },
        ),
      ),
    );
  }
}
