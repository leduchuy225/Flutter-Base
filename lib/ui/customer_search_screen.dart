import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/my_texttile.dart';
import 'package:get/get.dart';

import '../data/repair_request_api.dart';
import '../models/customer/customer_search_model_response.dart';

class CustomerSearchScreen extends StatefulWidget {
  const CustomerSearchScreen({super.key});

  @override
  State<CustomerSearchScreen> createState() => _CustomerSearchScreenState();
}

class _CustomerSearchScreenState extends State<CustomerSearchScreen> {
  CustomerSearchModelResponse? _data;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final response = await Get.find<RepairRequestApi>()
          .searchCustomer({})
          .callApi();

      final data = response.data;
      if (data != null) {
        setState(() {
          _data = data.customers;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar('Tra cứu khách hàng'),
      body: SingleChildScrollView(
        padding: AppStyles.horizontalPadding,
        child: Column(
          children: [
            MyTexttile.card(
              title: (_data?.idLong ?? '').toString(),
              items: [
                MyTexttileItem(titleText: 'Tên KH'),
                MyTexttileItem(titleText: 'Mã KH'),
                MyTexttileItem(titleText: 'Acc KH'),
                MyTexttileItem(titleText: 'Tình trạng'),
                MyTexttileItem(titleText: 'Tình trạng HĐ'),
                MyTexttileItem(titleText: 'Tình trạng chặn cắt'),
                MyTexttileItem(titleText: 'Ngày HT thi công'),
                MyTexttileItem(titleText: 'Ngày hết hạn'),
                MyTexttileItem(titleText: 'Gói cước'),
                MyTexttileItem(titleText: 'Mã NV'),
                MyTexttileItem(titleText: 'Tên NVPT'),
                MyTexttileItem(titleText: 'KV lắp đặt'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
