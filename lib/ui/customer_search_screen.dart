import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/data_state_widget.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';
import 'package:get/get.dart';

import '../data/repair_request_api.dart';
import '../models/customer/customer_search_model_response.dart';
import '../widgets/text_field/text_field_controller.dart';

class CustomerSearchScreen extends StatefulWidget {
  const CustomerSearchScreen({super.key});

  @override
  State<CustomerSearchScreen> createState() => _CustomerSearchScreenState();
}

class _CustomerSearchScreenState extends State<CustomerSearchScreen> {
  CustomerSearchModelResponse? _data;

  final _customerIdTextController = MyTextFieldController();

  Future searchData() async {
    final response = await Get.find<RepairRequestApi>()
        .searchCustomer({})
        .callApi();

    final data = response.data;
    if (data != null) {
      setState(() {
        _data = data.customers;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar('Tra cứu khách hàng'),
      body: SingleChildScrollView(
        padding: AppStyles.horizontalPadding,
        child: Column(
          children: [
            AppStyles.pdt15,
            Card(
              child: Padding(
                padding: const EdgeInsetsGeometry.all(16),
                child: Column(
                  children: [
                    MyTextField(
                      labelText: 'Mã KH',
                      controller: _customerIdTextController,
                    ),
                    AppStyles.pdt15,
                    ElevatedButton(
                      child: const Text('Tìm kiếm'),
                      onPressed: () async {
                        await searchData();
                      },
                    ),
                  ],
                ),
              ),
            ),
            AppStyles.pdt15,
            Visibility(
              visible: _data != null,
              child: MyTexttile.card(
                title: (_data?.idLong ?? '').toString(),
                items: [
                  MyTexttileItem(titleText: 'Mã KH', text: _data?.idLong),
                  MyTexttileItem(titleText: 'Tên KH', text: _data?.fullName),
                  MyTexttileItem(
                    titleText: 'SĐT',
                    isPhoneNumber: true,
                    text: _data?.phoneNumber,
                  ),
                  MyTexttileItem(titleText: 'CCCD', text: _data?.cccd),
                  // MyTexttileItem(titleText: 'Acc KH', text: _data),
                  // MyTexttileItem(titleText: 'Tình trạng', text: _data),
                  // MyTexttileItem(titleText: 'Tình trạng HĐ', text: _data),
                  // MyTexttileItem(titleText: 'Tình trạng chặn cắt', text: _data),
                  // MyTexttileItem(titleText: 'Ngày HT thi công', text: _data),
                  // MyTexttileItem(titleText: 'Ngày hết hạn', text: _data),
                  // MyTexttileItem(titleText: 'Gói cước', text: _data),
                  // MyTexttileItem(titleText: 'Mã NV', text: _data),
                  // MyTexttileItem(titleText: 'Tên NVPT', text: _data),
                  // MyTexttileItem(titleText: 'KV lắp đặt', text: _data),
                ],
              ),
              replacement: MyDataState.empty(),
            ),
          ],
        ),
      ),
    );
  }
}
