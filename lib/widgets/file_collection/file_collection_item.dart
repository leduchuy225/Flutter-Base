import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/file_collection_model.dart';

class FileCollectionItem extends StatelessWidget {
  final FileCollectionModel item;

  const FileCollectionItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    if (item.isLocal) {
      return Image.file(File(item.filePath));
    }
    return CachedNetworkImage(
      imageUrl: item.filePath,
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
      placeholder: (context, url) {
        return const CircularProgressIndicator();
      },
    );
  }
}
