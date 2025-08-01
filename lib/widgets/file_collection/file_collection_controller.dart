import 'dart:io';

import 'package:get/get.dart';

import '../../models/file_collection_model.dart';

class FileCollectionController extends GetxController {
  var files = <FileCollectionModel>[].obs;

  void addFiles(List<FileCollectionModel> data) {
    files.insertAll(0, data);
  }

  void removeFile(FileCollectionModel data) {
    files.remove(data);
  }

  File? get firstFile {
    return files.first.file;
  }

  List<File> getLocalFiles() {
    return files
        .where((file) {
          return file.isLocal;
        })
        .map((file) {
          return File(file.filePath);
        })
        .toList();
  }
}
