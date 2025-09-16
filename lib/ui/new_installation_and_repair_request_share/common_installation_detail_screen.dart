import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/datetime_utils.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/ui/new_installation_and_repair_request_share/widgets/overdue_reason_widget.dart';
import 'package:flutter_base/ui/new_installation_and_repair_request_share/widgets/request_cancellation_widget.dart';
import 'package:flutter_base/widgets/dialog/bottom_sheet_widget.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:get/get.dart';

import '../../../widgets/dialog/dialog_widget.dart';
import '../../../widgets/my_tag_widget.dart';
import 'common_installation_detail_controller.dart';
import 'widgets/common_installation_note.dart';

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
        onPressed: () async {
          if (controller.isRefreshValue) {
            controller.getNoteList();
          }
          MyBottomSheet.showDraggableScrollableSheet(
            context,
            builder: (context, scrollController) {
              return GetBuilder(
                init: controller,
                builder: (controller) {
                  return CommonInstallationNote(
                    canAddNote: true,
                    onRefresh: controller.getNoteList,
                    notes: controller.noteListRxData,
                    scrollController: scrollController,
                    noteTextController: controller.noteTextController,
                    onPressed: () {
                      if (controller.id == null) {
                        return;
                      }
                      if (!controller.noteTextController.checkValidation()) {
                        return;
                      }
                      MyDialog.alertDialog(
                        okHandler: controller.addNote,
                        message: 'Xác nhận thêm ghi chú mới ?',
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
      appBar: MyAppbar.appBar(
        title,
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
                    if (!controller.closeNoteTextController.checkValidation()) {
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
      body: GetBuilder(
        init: controller,
        builder: (controller) {
          final overdueTime = controller.getOverdueTime();
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: AppStyles.horizontalPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Visibility(
                        visible: controller.isRequestClosed,
                        child: Padding(
                          padding: const EdgeInsetsGeometry.only(top: 20),
                          child: Center(
                            child: Text(
                              'Yêu cầu đã hoàn thành',
                              style: AppTextStyles.title1.copyWith(
                                color: AppColors.error,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible:
                            overdueTime.isNotEmpty &&
                            !controller.isRequestClosed,
                        child: Padding(
                          padding: const EdgeInsetsGeometry.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Giải trình chậm trễ',
                                style: AppTextStyles.title1,
                              ),
                              AppStyles.pdt15,
                              Text(
                                'Dự kiến $overdueTime\nQuá thời gian dự kiến hoàn thành.',
                                style: AppTextStyles.body1.copyWith(
                                  color: AppColors.error,
                                ),
                              ),
                              AppStyles.pdt15,
                              OverdueReasonWidget(
                                noteTextController:
                                    controller.overdueNoteTextController,
                                onPressed: () {
                                  if (controller.id == null) {
                                    return;
                                  }
                                  if (!controller.overdueNoteTextController
                                      .checkValidation()) {
                                    return;
                                  }
                                  MyDialog.alertDialog(
                                    message: 'Xác nhận giải trình ?',
                                    okHandler: controller.addOverdueReason,
                                  );
                                },
                                onRightIconPressed: () {
                                  MyBottomSheet.showDraggableScrollableSheet(
                                    context,
                                    builder: (context, scrollController) {
                                      return GetBuilder(
                                        init: controller,
                                        builder: (controller) {
                                          return OverdueReasonListWidget(
                                            scrollController: scrollController,
                                            notes: controller
                                                .overdueNoteListRxData,
                                            onRefresh:
                                                controller.getOverdueReasonList,
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
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
                      AppStyles.pdt15,
                    ],
                  ),
                ),
              ),
              Visibility(
                visible:
                    controller.isRequestReadyToClose &&
                    !controller.isRequestClosed,
                child: Padding(
                  padding: const EdgeInsetsGeometry.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: Column(
                    children: [
                      Visibility(
                        visible:
                            controller.technicalStaffReportCompletedDate !=
                            null,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Đã hoàn thành yêu cầu vào lúc ${MyDatetimeUtils.formatDateFromAPI(controller.technicalStaffReportCompletedDate)}',
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.error,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            AppColors.mobifoneRandom8,
                          ),
                        ),
                        onPressed: () {
                          MyDialog.alertDialog(
                            message: 'Xác nhận hoàn thành yêu cầu ?',
                            okHandler: () {
                              controller.completeRquest(context);
                            },
                          );
                        },
                        child: const Text('Hoàn thành yêu cầu'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
