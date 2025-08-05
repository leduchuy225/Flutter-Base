import 'dart:io';

import 'package:equatable/equatable.dart';

class FileCollectionModel extends Equatable {
  final String fileName;
  final String filePath;

  final bool isLocal;

  const FileCollectionModel({
    required this.fileName,
    required this.filePath,
    this.isLocal = false,
  });

  File? get file => isLocal == true ? File(filePath) : null;

  @override
  List<Object?> get props => [fileName];
}
