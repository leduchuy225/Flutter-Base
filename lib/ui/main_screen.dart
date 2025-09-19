import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/data/common_api.dart';
import 'package:flutter_base/ui/dev_screen.dart';
import 'package:flutter_base/ui/divider/divider_list_screen.dart';
import 'package:flutter_base/ui/repair_request/repair_request_list/repair_request_list_screen.dart';
import 'package:flutter_base/ui/slid/slid_list_screen.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:flutter_base/widgets/function_item.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:flutter_base/widgets/webview/my_webview_screen.dart';
import 'package:get/get.dart';

import '../core/services/notification_service.dart';
import '../core/services/user_service.dart';
import '../theme/styles.dart';
import '../widgets/drawer/scaffold_drawer_widget.dart';
import 'new_installation/new_installation_list/new_installation_list_screen.dart';
import 'olt/olt_list_screen.dart';
import 'pon_id/pon_id_list_screen.dart';
import 'search_customer/search_customer_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Map? amount;

  final _userService = Get.find<UserService>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await NotificationService.handleFirebaseMessaging(context);
      await getAmountOfRequest();
    });
  }

  Future getAmountOfRequest() async {
    final response = await Get.find<CommonApi>().getAmountOfRequest().callApi(
      isShowLoading: false,
      isShowErrorMessage: false,
      isShowSuccessMessage: false,
    );
    final data = response.data;
    if (data is Map) {
      setState(() {
        amount = data;
      });
    }
  }

  Future navigateAndHandleWhenBack(dynamic page) async {
    await Get.to(page);
    await getAmountOfRequest();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      appBar: MyAppbar.appBar('Màn hình chính'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GetBuilder(
            init: _userService,
            builder: (service) {
              return Container(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                color: AppColors.mobifiberRandom2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.account_box_rounded,
                          color: AppColors.textLight,
                        ),
                        AppStyles.pdl10,
                        Expanded(
                          child: Text(
                            service.userInfor?.fullName ?? '',
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.textLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppStyles.pdt10,
                    Row(
                      children: [
                        const Icon(Icons.email, color: AppColors.textLight),
                        AppStyles.pdl10,
                        Expanded(
                          child: Text(
                            service.userInfor?.email ?? '',
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.textLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                MainFunctionItem(
                  title: 'Lắp mới',
                  counter: amount?['newConnectionRequest'],
                  icon: Icons.home_repair_service_rounded,
                  onTap: () async {
                    await navigateAndHandleWhenBack(
                      () => const NewInstallationListScreen(),
                    );
                  },
                ),
                MainFunctionItem(
                  icon: Icons.build,
                  title: 'Sửa chữa',
                  counter: amount?['repairRequest'],
                  onTap: () async {
                    await navigateAndHandleWhenBack(
                      () => const RepairRequestListScreen(),
                    );
                  },
                ),
                MainFunctionItem(
                  icon: Icons.search,
                  title: 'Tra cứu KH',
                  onTap: () async {
                    await navigateAndHandleWhenBack(
                      () => const SearchCustomerScreen(),
                    );
                  },
                ),
                MainFunctionItem(
                  icon: Icons.map,
                  title: 'Bản đồ hạ tầng',
                  onTap: () async {
                    final mapURL = await Config().googleMapURL;
                    if (mapURL == null) {
                      MyDialog.snackbar(
                        'Không tìm thấy liên kết bản đồ',
                        type: SnackbarType.ERROR,
                      );
                      return;
                    }
                    await navigateAndHandleWhenBack(
                      () =>
                          MyWebviewScreen(url: mapURL, title: 'Bản đồ hạ tầng'),
                    );
                  },
                ),
                MainFunctionItem(
                  icon: Icons.offline_bolt,
                  title: 'OLT',
                  onTap: () async {
                    await navigateAndHandleWhenBack(
                      () => const OltListScreen(),
                    );
                  },
                ),
                MainFunctionItem(
                  icon: Icons.polyline_rounded,
                  title: 'PON ID',
                  onTap: () async {
                    await navigateAndHandleWhenBack(
                      () => const PonIdListScreen(),
                    );
                  },
                ),
                MainFunctionItem(
                  icon: Icons.device_hub,
                  title: 'Bộ chia',
                  onTap: () async {
                    await navigateAndHandleWhenBack(
                      () => const DividerListScreen(),
                    );
                  },
                ),
                MainFunctionItem(
                  icon: Icons.shape_line_rounded,
                  title: 'SLID',
                  onTap: () async {
                    await navigateAndHandleWhenBack(
                      () => const SlidListScreen(),
                    );
                  },
                ),
                if (Config().isDevMode)
                  MainFunctionItem(
                    icon: Icons.developer_mode,
                    title: 'DEV',
                    onTap: () async {
                      await navigateAndHandleWhenBack(() => const DevScreen());
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
