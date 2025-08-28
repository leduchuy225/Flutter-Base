import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/pdf_viewer_screen.dart';
import 'package:get/get.dart';

import '../../../../core/utils/utils.dart';

class SignReportFileItemModel {
  String url;
  bool isSigned;

  final int id;
  final String name;
  final String pathName;

  SignReportFileItemModel({
    required this.id,
    required this.url,
    required this.name,
    this.isSigned = false,
    required this.pathName,
  });
}

class ReportFileItem extends StatelessWidget {
  final bool isSelectable;
  final int? reportSelectedIdToSign;
  final SignReportFileItemModel item;
  final void Function(int?)? onChanged;

  const ReportFileItem({
    super.key,
    this.onChanged,
    required this.item,
    this.reportSelectedIdToSign,
    this.isSelectable = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final pdfPath = getFileLink(await convertDocToPdf(item.pathName));
        if (pdfPath == null) {
          return;
        }
        Get.to(() => PdfViewerScreen(pdfPath: pdfPath, title: item.name));
      },
      child: Card(
        child: ListTile(
          title: Text(
            item.url.split('/').last,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          leading: const Icon(Icons.document_scanner),
          trailing: isSelectable
              ? Radio(
                  value: item.id,
                  onChanged: onChanged,
                  groupValue: reportSelectedIdToSign,
                )
              : null,
        ),
      ),
    );
  }
}
