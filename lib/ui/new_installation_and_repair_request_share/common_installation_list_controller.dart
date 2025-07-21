import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommonInstallationListController<T> extends GetxController {
  final _pageState = Rx(PagingState<int, T>());

  set pageState(PagingState<int, T> value) {
    _pageState.value = value;
  }

  PagingState<int, T> get pageState => _pageState.value;

  void reset() {
    pageState = PagingState<int, T>();
  }
}
