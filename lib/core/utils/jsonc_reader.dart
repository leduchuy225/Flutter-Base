import 'dart:convert';

import 'package:flutter/services.dart';

String stripJsonComments(String input) {
  final singleLineComment = RegExp(r'\/\/.*?$|^\s*\/\/.*$', multiLine: true);
  final multiLineComment = RegExp(r'\/\*[\s\S]*?\*\/');
  return input
      .replaceAll(singleLineComment, '')
      .replaceAll(multiLineComment, '');
}

Future readJsoncFile(String path, {int index = 0}) async {
  final content = await rootBundle.loadString(path);
  final cleanedJson = stripJsonComments(content);
  final data = jsonDecode(cleanedJson);

  if (data is List) {
    return data.elementAtOrNull(index);
  }
  return data;
}
