import 'package:analyzer/dart/element/element.dart';
import 'package:api_annotation/src/helpers/api_annotation_helper.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../generator/model_visitor.dart';
import '../models/api_annotation.dart';

class ApiGenerator extends GeneratorForAnnotation<ApiAnnotation> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final ModelVisitor visitor = ModelVisitor();
    element.visitChildren(visitor);

    final StringBuffer buffer = StringBuffer();

    buffer.writeln('class ${getClassName(visitor.className)} extends ${visitor.className} {');

    visitor.methods.forEach((key, value) {
      buffer.writeln('// $value');
    });

    buffer.writeln('}');

    return buffer.toString();
  }
}
