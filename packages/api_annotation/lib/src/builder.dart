import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'generator/build_annotation.dart';

Builder buildApiAnnotation(BuilderOptions options) {
  return SharedPartBuilder([ApiGenerator()], 'api_annotation');
}
