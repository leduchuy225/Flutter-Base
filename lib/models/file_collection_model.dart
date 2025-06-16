import 'package:equatable/equatable.dart';

class FileCollectionModel extends Equatable {
  final String fileName;
  final String filePath;

  final bool isLocal;

  const FileCollectionModel({
    required this.fileName,
    required this.filePath,
    required this.isLocal,
  });

  @override
  List<Object?> get props => [fileName];
}
