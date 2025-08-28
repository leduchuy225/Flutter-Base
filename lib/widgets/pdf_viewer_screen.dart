import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewerScreen extends StatelessWidget {
  final String title;
  final String pdfPath;

  const PdfViewerScreen({super.key, required this.pdfPath, this.title = 'PDF'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar(title),
      body: const PDF().fromUrl(
        pdfPath,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
