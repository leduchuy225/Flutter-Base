import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/core/utils/datetime_utils.dart';
import 'package:flutter_base/data/customer_api.dart';
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
import '../../models/customer/customer_search_model_response.dart';
import '../../models/customer/customer_search_payload.dart';
import '../../models/customer/customer_search_set.dart';
import '../../widgets/data_state_widget.dart';
import '../../widgets/text_field/text_field_controller.dart';

class SearchCustomerScreen extends StatefulWidget {
  const SearchCustomerScreen({super.key});

  @override
  State<SearchCustomerScreen> createState() => _SearchCustomerScreenState();
}

class _SearchCustomerScreenState extends State<SearchCustomerScreen> {
  final _codeTextController = MyTextFieldController();
  final _cccdTextController = MyTextFieldController();
  final _nameTextController = MyTextFieldController();
  final _phoneTextController = MyTextFieldController();

  var _state = PagingState<int, CustomerSearchModelResponse>();

  bool _getIsEmptySearchText({required bool isShowError}) {
    if (_codeTextController.textTrim.isNotEmpty ||
        _cccdTextController.textTrim.isNotEmpty ||
        _nameTextController.textTrim.isNotEmpty ||
        _phoneTextController.textTrim.isNotEmpty) {
      return false;
    }

    if (isShowError) {
      MyDialog.snackbar('Chưa nhập thông tin tìm kiếm');
    }

    return true;
  }

  Future<List<CustomerSearchModelResponse>> getData({required int page}) async {
    final body = CustomerSearchPayload(
      coundLoad: 1,
      searchDefault: SearchDefaultModelPayload(
        page: page,
        typeOrder: true,
        pageSize: Config.pageSizeDefault,
      ),
      searchSet: CustomerSearchSet(
        // idLong: _codeTextController.textTrim,
        cccd: _cccdTextController.textTrim,
        code: _codeTextController.textTrim,
        fullName: _nameTextController.textTrim,
        phoneNumber: _phoneTextController.textTrim,
      ),
    );

    final response = await Get.find<CustomerApi>()
        .searchCustomer(body)
        .callApi(isShowSuccessMessage: false);

    return response.data?.model ?? [];
  }

  Future fetchNextPage({
    bool isRefresh = false,
    bool isShowError = false,
  }) async {
    if (isRefresh) {
      setState(() {
        _state = PagingState<int, CustomerSearchModelResponse>();
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
      appBar: MyAppbar.appBar('Tra cứu khách hàng'),
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
                      labelText: 'Mã KH',
                      controller: _codeTextController,
                    ),
                    AppStyles.pdt20,
                    MyTextField(
                      labelText: 'CCCD / Mã số thuế',
                      controller: _cccdTextController,
                      keyboardType: TextInputType.number,
                    ),
                    AppStyles.pdt20,
                    MyTextField(
                      labelText: 'Tên khách hàng',
                      controller: _nameTextController,
                    ),
                    AppStyles.pdt20,
                    MyTextField(
                      labelText: 'Số điện thoại',
                      controller: _phoneTextController,
                      keyboardType: TextInputType.number,
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
                title: 'Danh sách khách hàng',
                number: (_state.items ?? []).length,
              ),
            ),
          ),
          PagedSliverList<int, CustomerSearchModelResponse>(
            state: _state,
            fetchNextPage: fetchNextPage,
            builderDelegate:
                PagedChildBuilderDelegate<CustomerSearchModelResponse>(
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
                        title: item.fullName,
                        items: [
                          MyTexttileItem(text: item.code, titleText: 'Mã KH'),
                          MyTexttileItem(text: item.userName, titleText: 'ACC'),
                          MyTexttileItem(text: item.cccd, titleText: 'CCCD'),
                          MyTexttileItem(
                            titleText: 'SĐT',
                            isPhoneNumber: true,
                            text: item.phoneNumber,
                          ),
                          MyTexttileItem(
                            titleText: 'Địa chỉ',
                            text: item.addressSet,
                          ),
                          MyTexttileItem(
                            titleText: 'Dịch vụ',
                            text: item.serviceTitle,
                          ),
                          MyTexttileItem(titleText: 'ACC', text: item.userName),
                          MyTexttileItem(
                            titleText: 'Mã NV',
                            text: item.staffCode,
                          ),
                          MyTexttileItem(
                            titleText: 'Tên NVPT',
                            text: item.staffFullName,
                          ),
                          MyTexttileItem(
                            titleText: 'Tình trạng HĐ',
                            text: item.contractStatusTitle,
                          ),
                          MyTexttileItem(
                            titleText: 'Tình trạng chặn cắt',
                            text: item.blockingStatusTitle,
                          ),
                          MyTexttileItem(
                            titleText: 'Ngày HT thi công',
                            text: MyDatetimeUtils.formatDateFromAPI(
                              item.completionDate,
                            ),
                          ),
                          MyTexttileItem(
                            titleText: 'Ngày hết hạn',
                            text: MyDatetimeUtils.formatDateFromAPI(
                              item.endDate,
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
