import 'package:analyzer/dart/element/element.dart';

import '../../api_annotation.dart';

bool isApiMethodContain(List<ElementAnnotation> metadata) {
  return metadata.isEmpty ? false : metadata.any((element) => element.element is ApiMethod);
}

String getClassName(String name) {
  return name.replaceAll('_', '');
}
