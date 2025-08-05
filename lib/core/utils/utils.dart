import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_base/core/const/constants.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

T? getAtIndex<T>(List<T>? data, int index) {
  if (data == null) {
    return null;
  }
  if (data.length <= index) {
    return null;
  }
  return data[index];
}

bool isNumeric(dynamic s) {
  if (s == null) {
    return false;
  }
  if (s is num) {
    return true;
  }
  return double.tryParse(s) != null;
}

String formatMoney(dynamic currency, [bool hasSuffix = true]) {
  String value = '0';
  if (currency is num) {
    value = formatIntCurrency(currency);
  } else if (currency is String) {
    value = formatIntCurrency(num.tryParse(currency) ?? 0);
  }
  return '$value ${hasSuffix ? 'đ' : ''}'.trim();
}

String formatIntCurrency(dynamic money) {
  return NumberFormat('#,##0', 'en_US').format(money);
}

Image imageFromBase64String(
  String base64String, {
  double? width,
  double? height,
}) {
  return Image.memory(
    base64Decode(base64String.split(',').last),
    width: width,
    height: height,
  );
}

bool isNullOrEmpty(String? value) {
  return value == null || value.isEmpty;
}

bool isNotNullOrEmpty(String? value) {
  return value != null && value.isNotEmpty;
}

Future<void> launchMyURL(
  String? data, {
  LaunchMode mode = LaunchMode.platformDefault,
}) async {
  if (data == null) {
    return;
  }
  try {
    await launchUrlString(data, mode: mode);
  } catch (error) {
    MyDialog.snackbar(error.toString(), type: SnackbarType.WARNING);
  }
}

String getNumericOnly(String data) {
  return data.replaceAll(RegExp(r'[^0-9]'), '');
}

Map<String, dynamic> convertStringToMap(String? data) {
  if (isNullOrEmpty(data)) {
    return {};
  }
  try {
    return jsonDecode(data!);
  } catch (error) {
    return {};
  }
}

String? getFileLink(String? data) {
  if (isNullOrEmpty(data)) {
    return null;
  }
  return '${MyStrings.baseURL}$data';
}
