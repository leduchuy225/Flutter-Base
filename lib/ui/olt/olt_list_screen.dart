import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/core/utils/datetime_utils.dart';
import 'package:flutter_base/data/olt_api.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';
import 'package:flutter_base/widgets/title_number_indicator.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../core/const/constants.dart';
import '../../models/common/search_default_model_payload.dart';
import '../../models/olt/olt_list_model_response.dart';
import '../../models/olt/olt_list_payload.dart';
import '../../models/olt/olt_search_set_payload.dart';
import '../../widgets/data_state_widget.dart';
import '../../widgets/text_field/text_field_controller.dart';

class OltListScreen extends StatefulWidget {
  const OltListScreen({super.key});

  @override
  State<OltListScreen> createState() => _OltListScreenState();
}

class _OltListScreenState extends State<OltListScreen> {
  final _codeTextController = MyTextFieldController();
  final _nameTextController = MyTextFieldController();

  var _state = PagingState<int, OltListModelResponse>();

  bool _getIsEmptySearchText({required bool isShowError}) {
    if (_codeTextController.textTrim.isNotEmpty ||
        _nameTextController.textTrim.isNotEmpty) {
      return false;
    }

    if (isShowError) {
      MyDialog.snackbar('Chưa nhập thông tin tìm kiếm');
    }

    return true;
  }

  Future<List<OltListModelResponse>> getData({required int page}) async {
    final body = OltListPayload(
      coundLoad: 1,
      searchDefault: SearchDefaultModelPayload(
        page: page,
        typeOrder: true,
        pageSize: Config.pageSizeDefault,
      ),
      searchSet: OltSearchSetPayload(
        code: _nameTextController.textTrim,
        idLong: _codeTextController.textTrim,
      ),
    );

    final response = await Get.find<OltApi>()
        .getOltList(body)
        .callApi(isShowSuccessMessage: false);

    return response.data?.model ?? [];
  }

  Future fetchNextPage({
    bool isRefresh = false,
    bool isShowError = false,
  }) async {
    if (isRefresh) {
      setState(() {
        _state = PagingState<int, OltListModelResponse>();
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
    final isLastPage = newItems.isEmpty;

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
      appBar: MyAppbar.appBar('Tra cứu OLT'),
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
                      labelText: 'Mã OTL',
                      controller: _codeTextController,
                    ),
                    AppStyles.pdt20,
                    MyTextField(
                      labelText: 'Tên OLT',
                      controller: _nameTextController,
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
                title: 'Danh sách OLT',
                number: (_state.items ?? []).length,
              ),
            ),
          ),
          PagedSliverList<int, OltListModelResponse>(
            state: _state,
            fetchNextPage: fetchNextPage,
            builderDelegate: PagedChildBuilderDelegate<OltListModelResponse>(
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
                    title: item.code,
                    items: [
                      MyTexttileItem(text: item.idLong, titleText: 'Mã OLT'),
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
