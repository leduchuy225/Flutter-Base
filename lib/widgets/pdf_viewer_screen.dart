import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewerScreen extends StatelessWidget {
  final String pdfPath;

  const PdfViewerScreen({super.key, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar('PDF'),
      body: const PDF(swipeHorizontal: true).cachedFromUrl(pdfPath),
    );
  }
}
