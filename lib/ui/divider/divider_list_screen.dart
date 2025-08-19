import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/core/utils/datetime_utils.dart';
import 'package:flutter_base/data/bo_chia_api.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';
import 'package:flutter_base/widgets/title_number_indicator.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/const/constants.dart';
import '../../models/bo_chia/bo_chia_list_model_response.dart';
import '../../models/bo_chia/bo_chia_list_payload.dart';
import '../../models/bo_chia/bo_chia_search_set_payload.dart';
import '../../models/common/search_default_model_payload.dart';
import '../../widgets/data_state_widget.dart';
import '../../widgets/text_field/text_field_controller.dart';

class DividerListScreen extends StatefulWidget {
  const DividerListScreen({super.key});

  @override
  State<DividerListScreen> createState() => _DividerListScreenState();
}

class _DividerListScreenState extends State<DividerListScreen> {
  final _ponIdTextController = MyTextFieldController();
  final _oltIdTextController = MyTextFieldController();
  final _dividerIdTextController = MyTextFieldController();
  final _dividerNameTextController = MyTextFieldController();
  final _portNumberTextController = MyTextFieldController();

  var _state = PagingState<int, BoChiaListModelResponse>();

  bool _getIsEmptySearchText({required bool isShowError}) {
    if (_ponIdTextController.textTrim.isNotEmpty ||
        _oltIdTextController.textTrim.isNotEmpty ||
        _dividerIdTextController.textTrim.isNotEmpty ||
        _dividerNameTextController.textTrim.isNotEmpty ||
        _portNumberTextController.textTrim.isNotEmpty) {
      return false;
    }

    if (isShowError) {
      MyDialog.snackbar('Chưa nhập thông tin tìm kiếm');
    }

    return true;
  }

  Future<List<BoChiaListModelResponse>> getData({required int page}) async {
    final body = BoChiaListPayload(
      coundLoad: 1,
      searchDefault: SearchDefaultModelPayload(
        page: page,
        typeOrder: true,
        pageSize: Config.pageSizeDefault,
      ),
      searchSet: BoChiaSearchSetPayload(
        oltIdLong: _oltIdTextController.textTrim,
        idLong: _dividerIdTextController.textTrim,
        code: _dividerNameTextController.textTrim,
        ponidIdLong: _ponIdTextController.textTrim,
        maxPort: _portNumberTextController.textTrim,
      ),
    );

    final response = await Get.find<BoChiaApi>()
        .getBoChiaList(body)
        .callApi(isShowSuccessMessage: false);

    return response.data?.model ?? [];
  }

  Future fetchNextPage({
    bool isRefresh = false,
    bool isShowError = false,
  }) async {
    if (isRefresh) {
      setState(() {
        _state = PagingState<int, BoChiaListModelResponse>();
      });
    }
    if (_getIsEmptySearchText(isShowError: isShowError)) {
      return;
    }
    if (_state.isLoading) {
      return;
    }

    setState(() {
      _state = _state.copyWith(isLoading: true);
    });

    final newKey = (_state.keys?.last ?? 0) + 1;
    final newItems = await getData(page: newKey);
    final isLastPage = newItems.length < Config.pageSizeDefault;

    setState(() {
      _state = _state.copyWith(
        isLoading: false,
        hasNextPage: !isLastPage,
        keys: [...?_state.keys, newKey],
        pages: [...?_state.pages, newItems],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar('Tra cứu PON ID'),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Bộ lọc tìm kiếm', style: AppTextStyles.title1),
                    AppStyles.pdt20,
                    MyTextField(
                      labelText: 'Mã bộ chia',
                      controller: _dividerIdTextController,
                    ),
                    AppStyles.pdt20,
                    MyTextField(
                      labelText: 'Tên bộ chia',
                      controller: _dividerNameTextController,
                    ),
                    AppStyles.pdt20,
                    MyTextField(
                      labelText: 'Mã OLT',
                      controller: _oltIdTextController,
                    ),
                    AppStyles.pdt20,
                    MyTextField(
                      labelText: 'Mã PON ID',
                      controller: _ponIdTextController,
                    ),
                    MyTextField(
                      labelText: 'SL Port',
                      controller: _portNumberTextController,
                    ),
                    AppStyles.pdt30,
                    ElevatedButton(
                      child: const Text('Tìm kiếm'),
                      onPressed: () {
                        fetchNextPage(isRefresh: true, isShowError: true);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(
                vertical: 10,
                horizontal: AppStyles.horizontalPaddingValue,
              ),
              child: TitleNumberIndicator(
                title: 'Danh sách bộ chia',
                number: (_state.items ?? []).length,
              ),
            ),
          ),
          PagedSliverList<int, BoChiaListModelResponse>(
            state: _state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate<BoChiaListModelResponse>(
              noItemsFoundIndicatorBuilder: (context) {
                return MyDataState.empty();
              },
              firstPageProgressIndicatorBuilder: (context) {
                return const SizedBox.shrink();
              },
              itemBuilder: (context, item, index) {
                return Padding(
                  padding: const EdgeInsetsGeometry.symmetric(
                    vertical: 8,
                    horizontal: AppStyles.horizontalPaddingValue,
                  ),
                  child: MyTexttile.card(
                    title: '# ${item.code}',
                    items: [
                      MyTexttileItem(
                        isCopy: true,
                        text: item.idLong,
                        titleText: 'Mã bộ chia',
                      ),
                      MyTexttileItem(
                        isCopy: true,
                        text: item.code,
                        titleText: 'Tên bộ chia',
                      ),
                      MyTexttileItem(text: item.maxPort, titleText: 'SL Port'),
                      MyTexttileItem(
                        isCopy: true,
                        text: item.oltIdLong,
                        titleText: 'Mã OLT',
                      ),
                      MyTexttileItem(
                        isCopy: true,
                        text: item.oltCode,
                        titleText: 'Tên OLT',
                      ),
                      MyTexttileItem(
                        text: item.googleMap,
                        titleText: 'Google Map',
                      ),
                      MyTexttileItem(
                        titleText: 'Ngày tạo',
                        text: MyDatetimeUtils.formatDateFromAPI(
                          item.createdDate,
                          toFormat: MyDateFormatEnum.DATE_TIME24s,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
