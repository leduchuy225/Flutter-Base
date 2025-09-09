import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/core/utils/datetime_utils.dart';
import 'package:flutter_base/data/slid_api.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:flutter_base/widgets/selector/selector_controller.dart';
import 'package:flutter_base/widgets/selector/selector_widget.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';
import 'package:flutter_base/widgets/title_number_indicator.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/const/constants.dart';
import '../../models/common/search_default_model_payload.dart';
import '../../models/slid/slid_list_model_response.dart';
import '../../models/slid/slid_list_payload.dart';
import '../../models/slid/slid_search_set_payload.dart';
import '../../widgets/data_state_widget.dart';
import '../../widgets/text_field/text_field_controller.dart';

class SlidListScreen extends StatefulWidget {
  const SlidListScreen({super.key});

  @override
  State<SlidListScreen> createState() => _SlidListScreenState();
}

class _SlidListScreenState extends State<SlidListScreen> {
  final _slidIdTextController = MyTextFieldController();
  final _slidCodeTextController = MyTextFieldController();
  final _oltCodeTextController = MyTextFieldController();
  final _ponIdCodeTextController = MyTextFieldController();
  final _statusSelectorController = MySelectorController();

  var _state = PagingState<int, SlidListModelResponse>();

  @override
  void initState() {
    super.initState();
    _statusSelectorController.selectors = [
      MySelectorModel(id: null, name: 'Tất cả'),
    ];
  }

  bool _getIsEmptySearchText({required bool isShowError}) {
    if (_slidIdTextController.textTrim.isNotEmpty ||
        _slidCodeTextController.textTrim.isNotEmpty ||
        _oltCodeTextController.textTrim.isNotEmpty ||
        _ponIdCodeTextController.textTrim.isNotEmpty) {
      return false;
    }

    if (isShowError) {
      MyDialog.snackbar('Chưa nhập thông tin tìm kiếm');
    }

    return true;
  }

  Future<List<SlidListModelResponse>> getData({required int page}) async {
    final body = SlidListPayload(
      coundLoad: 1,
      searchDefault: SearchDefaultModelPayload(
        page: page,
        typeOrder: true,
        pageSize: Config.pageSizeDefault,
      ),
      searchSet: SlidSearchSetPayload(
        code: _slidCodeTextController.textTrim,
        idLong: _slidIdTextController.textTrim,
        oltCode: _oltCodeTextController.textTrim,
        ponidCode: _ponIdCodeTextController.textTrim,
        isOnline: _statusSelectorController.first?.id,
      ),
    );

    final response = await Get.find<SlidApi>()
        .getSlidList(body)
        .callApi(isShowSuccessMessage: false);

    return response.data?.model ?? [];
  }

  Future fetchNextPage({
    bool isRefresh = false,
    bool isShowError = false,
  }) async {
    if (isRefresh) {
      setState(() {
        _state = PagingState<int, SlidListModelResponse>();
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
      appBar: MyAppbar.appBar('Tra cứu SLID'),
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
                      labelText: 'Mã SLID',
                      controller: _slidIdTextController,
                    ),
                    AppStyles.pdt20,
                    MyTextField(
                      labelText: 'Tên SLID',
                      controller: _slidCodeTextController,
                    ),
                    AppStyles.pdt20,
                    MyTextField(
                      labelText: 'Tên OLT',
                      controller: _oltCodeTextController,
                    ),
                    AppStyles.pdt20,
                    MyTextField(
                      labelText: 'Tên PON ID',
                      controller: _ponIdCodeTextController,
                    ),
                    AppStyles.pdt20,
                    MySelector(
                      title: 'Trạng thái',
                      controller: _statusSelectorController,
                      data: MySelectorData(
                        getFutureData: () async {
                          return [
                            MySelectorModel(id: null, name: 'Tất cả'),
                            MySelectorModel(id: true, name: 'Online'),
                            MySelectorModel(id: false, name: 'Offline'),
                          ];
                        },
                      ),
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
                title: 'Danh sách SLID',
                number: (_state.items ?? []).length,
              ),
            ),
          ),
          PagedSliverList<int, SlidListModelResponse>(
            state: _state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate<SlidListModelResponse>(
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
                    tag: item.isOnline == true ? 'Online' : 'Offline',
                    tagColor: item.isOnline == true
                        ? AppColors.success
                        : AppColors.error,
                    items: [
                      MyTexttileItem(
                        isCopy: true,
                        text: item.idLong,
                        titleText: 'Mã SLID',
                      ),
                      MyTexttileItem(
                        isCopy: true,
                        text: item.code,
                        titleText: 'Tên SLID',
                      ),
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
                        isCopy: true,
                        text: item.ponidIdLong,
                        titleText: 'Mã PON ID',
                      ),
                      MyTexttileItem(
                        isCopy: true,
                        text: item.ponidCode,
                        titleText: 'Tên PON ID',
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
