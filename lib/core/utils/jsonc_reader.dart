import 'dart:convert';

import 'package:flutter/services.dart';

String stripJsonComments(String input) {
  final singleLineComment = RegExp(r'\/\/.*?$|^\s*\/\/.*$', multiLine: true);
  final multiLineComment = RegExp(r'\/\*[\s\S]*?\*\/');
  return input
      .replaceAll(singleLineComment, '')
      .replaceAll(multiLineComment, '');
}

Future readJsoncFile(String path) async {
  final content = await rootBundle.loadString(path);
  final cleanedJson = stripJsonComments(content);
  final data = jsonDecode(cleanedJson);

  return data;
}

Map<String, dynamic> processJsonc(dynamic data) {
  if (data is! Map<String, dynamic>) {
    return {};
  }

  final Map<String, dynamic> tempData = {};

  data.forEach((key, value) {
    if (key.contains('.')) {
      if (value is Map<String, dynamic>) {
        tempData[key.split('.').first] = processJsonc(value);
      }
      if (value is List) {
        if (value.isNotEmpty && value.first is Map<String, dynamic>) {
          tempData[key.split('.').first] = value
              .map((element) => processJsonc(element))
              .toList();
        }
      }
    }
  });

  return {...data, ...tempData};
}
