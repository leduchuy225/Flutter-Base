import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/file_collection/file_collection_item.dart';
import 'package:get/get.dart';

import '../../models/file_collection_model.dart';
import 'file_collection_controller.dart';
import 'file_collection_slider.dart';

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

  Future<void> onPickImage() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result == null) {
      return;
    }
    final File file = File(result.files.single.path!);
    _mainController.addFiles([
      FileCollectionModel(
        isLocal: true,
        filePath: file.path,
        fileName: file.path,
      ),
    ]);
  }

  void onViewDetail() {
    Get.to(() {
      return FileCollectionSlider(data: _mainController.files);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(12),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.file_copy_outlined),
                      AppStyles.pdl5,
                      Text('Tệp đính kèm', style: AppTextStyles.title1),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {},
                        icon: const Icon(
                          Icons.camera,
                          size: 30,
                          color: AppColors.primary,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await onPickImage();
                        },
                        icon: const Icon(
                          Icons.image,
                          size: 30,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppStyles.pdt4,
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: _mainController.files.map((file) {
                  return FileCollectionItem(
                    item: file,
                    onViewDetail: onViewDetail,
                    onDeleteItem: (item) {
                      _mainController.removeFile(item);
                    },
                  );
                }).toList(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
