import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:flutter_base/ui/authentication/login_screen.dart';
import 'package:flutter_base/widgets/mobile_fiber.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../core/services/cache_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((data) async {
      final packageInfo = await PackageInfo.fromPlatform();
      CacheService().write(key: CacheService.packageInfo, value: packageInfo);

      Future.delayed(const Duration(seconds: 1)).then((value) {
        Get.offAll(() => const LoginScreen());
      });
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
                    style: AppTextStyles.h1.copyWith(fontSize: 50),
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
