import 'package:flutter/material.dart';
import 'package:flutter_base/core/services/user_service.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/ui/authentication/login_screen.dart';
import 'package:flutter_base/widgets/mobile_fiber.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../core/services/cache_service.dart';
import '../core/services/permission_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _userService = Get.find<UserService>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Request permission
      await PermissionService.requestNotificationPermission();

      final packageInfo = await PackageInfo.fromPlatform();
      CacheService().write(key: CacheService.packageInfo, value: packageInfo);

      final refreshToken = await UserService.refreshToken;

      if (refreshToken.isEmpty) {
        Get.offAll(() => const LoginScreen());
        return;
      }

      final updateUserResult = await _userService.updateUserInforFromAPI(
        isShowLoading: false,
        isNavigateToMain: true,
      );
      if (updateUserResult == false) {
        Get.offAll(() => const LoginScreen());
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: AppColors.defaultGradient),
        ),
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: Stack(
            children: [
              Positioned.fill(
                top: 200,
                child: Align(
                  child: MobileFiber(
                    style: AppTextStyles.h1.copyWith(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  alignment: Alignment.topCenter,
                ),
              ),
              const Positioned.fill(
                bottom: 150,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
