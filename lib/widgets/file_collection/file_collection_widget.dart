import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:flutter_base/widgets/file_collection/file_collection_item.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/file_collection_model.dart';
import 'file_collection_controller.dart';
import 'file_collection_slider.dart';

class FileCollectionWidget extends StatefulWidget {
  final int? limit;
  final String title;
  final int? imageQuality;
  final bool isViewImageOnly;
  final FileCollectionController? controller;

  const FileCollectionWidget({
    super.key,
    this.limit,
    this.controller,
    this.imageQuality = 30,
    this.isViewImageOnly = false,
    this.title = 'Tệp đính kèm',
  });

  @override
  State<FileCollectionWidget> createState() => _FileCollectionWidgetState();
}

class _FileCollectionWidgetState extends State<FileCollectionWidget> {
  final picker = ImagePicker();

  bool _isPickingImage = false;
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

  Future<void> onPickImage({bool isTakeFromCamera = false}) async {
    if (widget.limit != null && _mainController.files.length >= widget.limit!) {
      MyDialog.snackbar(
        'Giới hạn tối đa ${widget.limit} tệp tin',
        type: SnackbarType.WARNING,
      );
      return;
    }

    if (_isPickingImage) {
      return;
    }

    _isPickingImage = true;
    try {
      List<XFile> results = [];

      if (isTakeFromCamera) {
        final file = await picker.pickImage(
          source: ImageSource.camera,
          imageQuality: widget.imageQuality,
        );
        if (file != null) {
          results = [file];
        }
      } else {
        results = await picker.pickMultiImage(
          imageQuality: widget.imageQuality,
        );
      }

      _isPickingImage = false;

      if (results.isEmpty) {
        return;
      }
      _mainController.addFiles(
        results.map((element) {
          return FileCollectionModel(
            isLocal: true,
            fileName: element.name,
            filePath: element.path,
          );
        }).toList(),
      );
    } catch (error) {
      MyDialog.snackbar(error.toString(), type: SnackbarType.ERROR);
    } finally {
      _isPickingImage = false;
    }
  }

  void onViewDetail(int index) {
    Get.to(() {
      return FileCollectionSlider(
        initialPage: index,
        title: widget.title,
        data: _mainController.files,
      );
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
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.file_copy_outlined,
                          color: AppColors.textGreyDark,
                        ),
                        AppStyles.pdl5,
                        Expanded(
                          child: Text(
                            widget.title,
                            style: AppTextStyles.title2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !widget.isViewImageOnly,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await onPickImage(isTakeFromCamera: true);
                          },
                          icon: const Icon(
                            size: 30,
                            Icons.camera_alt_rounded,
                            color: AppColors.primary,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            await onPickImage();
                          },
                          icon: const Icon(
                            size: 30,
                            Icons.image,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppStyles.pdt4,
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                children: _mainController.files.mapIndexed((index, file) {
                  return FileCollectionItem(
                    item: file,
                    isViewImageOnly: widget.isViewImageOnly,
                    onViewDetail: () {
                      onViewDetail(index);
                    },
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
