import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/infinity_scroll_list/infinity_scroll_builder_delegate.dart';
import 'package:flutter_base/widgets/infinity_scroll_list/infinity_scroll_extension.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MyPagedListView extends StatefulWidget {
  const MyPagedListView({Key? key}) : super(key: key);

  @override
  State<MyPagedListView> createState() => _MyPagedListViewState();
}

class _MyPagedListViewState extends State<MyPagedListView> {
  final PagingController<int, int> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _pagingController.fetchPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, int>(
      pagingController: _pagingController,
      builderDelegate: MyInfinityScrollBuilderDelegate.build(
        itemBuilder: (context, item, index) {
          return Container();
        },
      ),
    );
  }
}
