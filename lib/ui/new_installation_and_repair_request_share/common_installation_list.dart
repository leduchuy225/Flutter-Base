import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/title_number_indicator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../widgets/data_state_widget.dart';
import 'common_installation_list_controller.dart';

class CommonInstallationListScreen<T> extends StatelessWidget {
  final String title;
  final Widget Function(T) buildChild;
  final CommonInstallationListController<T> controller;
  final Future<List<T>> Function({int page}) getData;

  const CommonInstallationListScreen({
    super.key,
    required this.title,
    required this.getData,
    required this.buildChild,
    required this.controller,
  });

  Future fetchNextPage() async {
    if (controller.pageState.isLoading) {
      return;
    }

    controller.pageState = controller.pageState.copyWith(isLoading: true);

    final newKey = (controller.pageState.keys?.last ?? 0) + 1;
    final newItems = await getData(page: newKey);
    final isLastPage = newItems.isEmpty;

    controller.pageState = controller.pageState.copyWith(
      isLoading: false,
      hasNextPage: !isLastPage,
      keys: [...?controller.pageState.keys, newKey],
      pages: [...?controller.pageState.pages, newItems],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar(
        title,
        action: IconButton(
          onPressed: controller.reset,
          icon: const Icon(Icons.replay_outlined),
        ),
      ),
      body: Obx(() {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: AppStyles.horizontalPaddingValue,
                ),
                child: TitleNumberIndicator(
                  title: 'Danh sách yêu cầu',
                  number: (controller.pageState.items ?? []).length,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Visibility(
                child: MyDataState.empty(),
                visible: (controller.pageState.items ?? []).isEmpty,
              ),
            ),
            PagedSliverList<int, T>(
              state: controller.pageState,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) {
                  return Padding(
                    child: buildChild(item),
                    padding: const EdgeInsetsGeometry.symmetric(
                      vertical: 10,
                      horizontal: AppStyles.horizontalPaddingValue,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
