import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/file_collection/file_collection_item.dart';
import 'package:get/get.dart';

import '../../models/file_collection_model.dart';
import 'file_collection_controller.dart';

class FileCollectionWidget extends StatefulWidget {
  final FileCollectionController? controller;

  const FileCollectionWidget({super.key, this.controller});

  @override
  State<FileCollectionWidget> createState() => _FileCollectionWidgetState();
}

class _FileCollectionWidgetState extends State<FileCollectionWidget> {
  late final FileCollectionController _controller;

  File? _imageFile;

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
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text('Tệp tin', style: AppTextStyles.title1),
              IconButton(
                onPressed: () async {
                  final FilePickerResult? result = await FilePicker.platform
                      .pickFiles(type: FileType.image);

                  if (result != null) {
                    final File file = File(result.files.single.path!);
                    setState(() {
                      _imageFile = file;
                    });
                    print(file.path);
                    // _mainController.addFiles([
                    //   FileCollectionModel(
                    //     isLocal: true,
                    //     filePath: file.path,
                    //     fileName: file.path,
                    //   ),
                    // ]);
                  } else {
                    // User canceled the picker
                  }
                },
                icon: const Icon(Icons.image),
              ),
            ],
          ),
          Center(
            child: _imageFile == null
                ? const Text('No image selected.')
                : Image.file(_imageFile!),
          ),
          Text('${_mainController.files.length}'),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: [
              Container(
                width: 50,
                height: 50,
                child: _imageFile == null
                    ? const Text('No image selected.')
                    : Image.file(_imageFile!),
              ),
              Container(
                child: _imageFile == null
                    ? const Text('No image selected.')
                    : Image.file(_imageFile!, fit: BoxFit.cover),
              ),
              Container(
                child: _imageFile == null
                    ? const Text('No image selected.')
                    : Image.file(_imageFile!, fit: BoxFit.fill),
              ),
            ],

            // children: _mainController.files.map((file) {
            //   return FileCollectionItem(item: file);
            // }).toList(),
          ),
        ],
      );
    });
  }
}
