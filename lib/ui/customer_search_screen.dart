import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/my_texttile.dart';

class CustomerSearchScreen extends StatefulWidget {
  const CustomerSearchScreen({super.key});

  @override
  State<CustomerSearchScreen> createState() => _CustomerSearchScreenState();
}

class _CustomerSearchScreenState extends State<CustomerSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyTexttile.card(
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
    );
  }
}
