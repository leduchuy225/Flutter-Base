import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/models/file_collection_model.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/file_collection/file_collection_item.dart';
import 'package:flutter_base/widgets/my_appbar.dart';

class FileCollectionSlider extends StatelessWidget {
  final String title;
  final int initialPage;
  final List<FileCollectionModel> data;

  const FileCollectionSlider({
    super.key,
    required this.data,
    this.initialPage = 0,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textGrey2,
      appBar: MyAppbar.appBar(title),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              initialPage: initialPage,
            ),
            items: data.map((item) {
              return FileCollectionItem.buildChild(context, item);
            }).toList(),
          );
        },
      ),
    );
  }
}
