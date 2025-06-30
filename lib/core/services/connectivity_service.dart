import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../theme/styles.dart';
import '../const/constants.dart';

class ConnectivityService extends GetxService {
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    _streamSubscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      switch (result[0]) {
        case ConnectivityResult.none:
          MyDialog.snackbar(
            MyStrings.connectionOff,
            type: SnackbarType.WARNING,
            icon: const Icon(Icons.wifi_off, color: AppColors.white),
          );
          return;
        default:
          return;
      }
    });
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
