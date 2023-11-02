import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ModelVisitor extends SimpleElementVisitor {
  late String className;
  late Map<String, FunctionType> methods = {};
  late Map<String, List<ElementAnnotation>> metaData = {};
  late Map<String, List<ParameterElement>> parameters = {};

  @override
  void visitConstructorElement(ConstructorElement element) {
    className = element.type.returnType.toString();
  }

  @override
  void visitMethodElement(MethodElement element) {
    methods[element.name] = element.type;
    metaData[element.name] = element.metadata;
    parameters[element.name] = element.parameters;
  }
}
