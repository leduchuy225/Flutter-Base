import 'package:flutter/material.dart';
import 'package:flutter_base/theme/styles.dart';
import 'package:get/get.dart';

import '../core/services/cache_service.dart';

class MyLoading extends StatelessWidget {
  static String myLoadingId = 'MyLoadingId';
  static final Map<String, OverlayEntry> _entries = {};

  static int get loadingCount {
    return CacheService().read<int>(key: CacheService.loadingCount) ?? 0;
  }

  static void setLoadingCount(int value) {
    CacheService().write<int>(key: CacheService.loadingCount, value: value);
  }

  static void show() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();

    setLoadingCount(loadingCount + 1);
    if (_entries.containsKey(myLoadingId)) {
      return;
    }
    setLoadingCount(1);
    final overlay = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            const ModalBarrier(dismissible: false, color: Colors.black54),
            GestureDetector(
              onTap: hide,
              child: MyLoading(),
              behavior: HitTestBehavior.translucent,
            ),
          ],
        );
      },
    );

    if (Get.overlayContext != null) {
      _entries[myLoadingId] = overlay;
      Overlay.of(Get.overlayContext!, rootOverlay: true).insert(overlay);
    }
  }

  static void hide() {
    setLoadingCount(loadingCount - 1);
    if (!_entries.containsKey(myLoadingId)) {
      return;
    }
    if (loadingCount <= 0) {
      setLoadingCount(0);
      _entries[myLoadingId]?.remove();
      _entries.remove(myLoadingId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                constraints: const BoxConstraints(
                  minWidth: 200.0,
                  maxWidth: 280.0,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
                child: Column(
                  children: [
                    Text(
                      'Đang xử lý yêu cầu...',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.title2.copyWith(
                        fontFamily: 'Roboto',
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(width: 5, color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
                child: const SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
