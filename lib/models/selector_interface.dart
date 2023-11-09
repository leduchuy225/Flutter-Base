import '../widgets/selector/selector_controller.dart';
import 'base_selector.dart';

class SelectorInterface {
  final MySelectorArguments? argument;
  final MySelectorController? controller;
  final List<MySelectorModel> Function()? getStaticData;

  SelectorInterface({
    this.argument,
    this.getStaticData,
    this.controller,
  }) : assert(argument != null && getStaticData != null);
}
