import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/dialog/bottom_sheet_widget.dart';

import '../../models/file_collection_model.dart';

class FileCollectionItem extends StatelessWidget {
  final bool isViewImageOnly;
  final FileCollectionModel item;
  final void Function() onViewDetail;
  final void Function(FileCollectionModel) onDeleteItem;

  const FileCollectionItem({
    super.key,
    required this.item,
    required this.onDeleteItem,
    required this.onViewDetail,
    this.isViewImageOnly = false,
  });

  static Widget buildChild(
    BuildContext context,
    FileCollectionModel item, {
    Color? errorIconColor,
    Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder,
  }) {
    if (item.isLocal) {
      return Image.file(File(item.filePath));
    }
    return CachedNetworkImage(
      imageUrl: item.filePath,
      imageBuilder: imageBuilder,
      errorWidget: (context, url, error) {
        return Icon(Icons.image_not_supported_rounded, color: errorIconColor);
      },
      placeholder: (context, url) {
        return const CircularProgressIndicator(padding: EdgeInsets.all(24));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MyBottomSheet.showBottomSheet(
          context,
          actions: [
            MyBottomSheetAction(
              id: 1,
              icon: Icons.image_search,
              title: 'Xem chi tiết',
              onTap: (context, id) {
                onViewDetail();
              },
            ),
            if (!isViewImageOnly)
              MyBottomSheetAction(
                id: 2,
                icon: Icons.delete,
                title: 'Xóa tệp tin',
                onTap: (context, id) {
                  onDeleteItem(item);
                },
              ),
          ],
        );
      },
      child: Container(
        child: FileCollectionItem.buildChild(context, item),
        margin: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          color: AppColors.textGrey2,
          borderRadius: AppCorners.mdBorder,
        ),
      ),
    );
  }
}
