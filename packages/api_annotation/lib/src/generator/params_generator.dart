import 'package:analyzer/dart/element/element.dart';

class ParamsGenerator {
  static String generateParams(List<ParameterElement> params) {
    final buffer = StringBuffer();
    buffer.write('{');

    final List<String> paramsList = [];
    for (final param in params) {
      paramsList.add('${getRequiredPart(param)} ${getTypePart(param)} ${getNamePart(param)} ${getDefaultValuePart(param)}');
    }

    buffer.writeAll(paramsList, ',');
    buffer.write('}');

    return buffer.toString();
  }

  static String getRequiredPart(ParameterElement element) {
    final type = element.type.toString();
    return type[type.length - 1] == '?' || element.hasDefaultValue ? '' : 'required';
  }

  static String getTypePart(ParameterElement element) {
    return element.type.toString();
  }

  static String getNamePart(ParameterElement element) {
    return element.name;
  }

  static String getDefaultValuePart(ParameterElement element) {
    return element.hasDefaultValue ? '= ${element.defaultValueCode}' : '';
  }
}
