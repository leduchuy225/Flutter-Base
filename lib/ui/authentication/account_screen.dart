import 'package:flutter/material.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:flutter_base/core/utils/utils.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/text_field/text_field_controller.dart';
import 'package:flutter_base/widgets/text_field/text_field_widget.dart';
import 'package:get/get.dart';

import '../../models/file_collection_model.dart';
import '../../widgets/file_collection/file_collection_item.dart';
import '../../widgets/scrollview_with_bottom_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _userService = Get.find<UserService>();

  final _nameTextController = MyTextFieldController();
  final _genderTextController = MyTextFieldController();
  final _emailTextController = MyTextFieldController();
  final _addressTextController = MyTextFieldController();

  @override
  void initState() {
    super.initState();

    _nameTextController.text = _userService.userInfor?.fullName ?? '';
    _genderTextController.text = _userService.userInfor?.gioiTinh ?? '';
    _emailTextController.text = _userService.userInfor?.email ?? '';
    _addressTextController.text = _userService.userInfor?.address ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar('Tài khoản'),
      body: ScrollViewWithBottom(
        padding: AppStyles.horizontalPadding,
        bodyChild: Column(
          children: [
            AppStyles.pdt25,
            if (isNotNullOrEmpty(_userService.userInfor?.avatar))
              Padding(
                padding: const EdgeInsetsGeometry.only(bottom: 25),
                child: FileCollectionItem.buildChild(
                  context,
                  FileCollectionModel(
                    isLocal: false,
                    fileName: 'AVATAR',
                    filePath: _userService.userInfor?.avatar ?? '',
                  ),
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: imageProvider,
                        ),
                      ),
                    );
                  },
                ),
              ),
            MyTextField(
              readOnly: true,
              labelText: 'Họ và tên',
              controller: _nameTextController,
            ),
            AppStyles.pdt25,
            MyTextField(
              readOnly: true,
              labelText: 'Giới tính',
              controller: _genderTextController,
            ),
            AppStyles.pdt25,
            MyTextField(
              readOnly: true,
              labelText: 'Email',
              controller: _emailTextController,
            ),
            AppStyles.pdt25,
            MyTextField(
              readOnly: true,
              labelText: 'Địa chỉ',
              controller: _addressTextController,
            ),
          ],
        ),
      ),
    );
  }
}
