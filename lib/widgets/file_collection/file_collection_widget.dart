import 'package:flutter/material.dart';

import 'file_collection_controller.dart';

class FileCollectionWidget extends StatefulWidget {
  final FileCollectionController? controller;

  const FileCollectionWidget({super.key, this.controller});

  @override
  State<FileCollectionWidget> createState() => _FileCollectionWidgetState();
}

class _FileCollectionWidgetState extends State<FileCollectionWidget> {
  late final FileCollectionController _controller;

  FileCollectionController get _mainController =>
      widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _controller = FileCollectionController();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _mainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
