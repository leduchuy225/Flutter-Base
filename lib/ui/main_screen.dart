import 'package:flutter/material.dart';
import 'package:flutter_base/ui/repair_request/repair_request_list/repair_request_list_screen.dart';
import 'package:flutter_base/widgets/function_item.dart';
import 'package:flutter_base/widgets/webview/my_webview_screen.dart';
import 'package:get/get.dart';

import '../core/services/notification_service.dart';
import '../core/services/user_service.dart';
import '../theme/styles.dart';
import '../widgets/drawer/scaffold_drawer_widget.dart';
import '../widgets/gradient_background.dart';
import 'new_installation/new_installation_list/new_installation_list_screen.dart';
import 'search_customer/search_customer_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _userService = Get.find<UserService>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await NotificationService.initializeFBMessaging(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    NotificationService.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GetBuilder(
            init: _userService,
            builder: (service) {
              return GradientBackground(
                padding: const EdgeInsets.all(16),
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
              );
            },
          ),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                MainFunctionItem(
                  title: 'Lắp mới',
                  icon: Icons.home_repair_service_rounded,
                  onTap: () {
                    Get.to(() => const NewInstallationListScreen());
                  },
                ),
                MainFunctionItem(
                  icon: Icons.build,
                  title: 'Sửa chữa',
                  onTap: () {
                    Get.to(() => const RepairRequestListScreen());
                  },
                ),
                MainFunctionItem(
                  icon: Icons.search,
                  title: 'Tra cứu KH',
                  onTap: () {
                    Get.to(() => const SearchCustomerScreen());
                  },
                ),
                MainFunctionItem(
                  icon: Icons.map,
                  title: 'Bản đồ hạ tầng',
                  onTap: () {
                    Get.to(
                      () => const MyWebviewScreen(
                        title: 'Bản đồ hạ tầng',
                        url:
                            'https://www.google.com/maps/d/u/0/viewer?mid=1Pct3jqqytWF5jv2oj9A_VYu3s0lC5-U&ll=20.807126436311332%2C106.77067050000002&z=11',
                      ),
                    );
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
