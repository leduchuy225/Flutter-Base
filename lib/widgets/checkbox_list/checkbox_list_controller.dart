import 'package:get/state_manager.dart';

class CheckboxValue<T> {
  final int id;
  final int? data;
  final bool? value;
  final String name;
  final T? extraData;

  CheckboxValue({
    this.data,
    this.value,
    this.extraData,
    required this.id,
    required this.name,
  });

  CheckboxValue<T> copyWith({bool? value, String? name, int? data}) {
    return CheckboxValue<T>(
      id: id,
      extraData: extraData,
      data: data ?? this.data,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }
}

class CheckboxListController<T> extends GetxController {
  final List<CheckboxValue<T>>? initialData;

  CheckboxListController({this.initialData}) {
    _data = RxList(initialData ?? []);
  }

  RxList<CheckboxValue<T>> _data = <CheckboxValue<T>>[].obs;

  set value(List<CheckboxValue<T>> data) {
    _data
      ..clear()
      ..addAll(data);
  }

  void setValueById(int id, {bool? value}) {
    final target = _data.indexWhere((element) => element.id == id);
    if (target == -1) {
      return;
    }
    _data[target] = _data[target].copyWith(value: value);

    _data.refresh();
  }

  bool? getValueById(int id) {
    final target = _data.indexWhere((element) => element.id == id);
    if (target == -1) {
      return null;
    }
    return _data[target].value;
  }

  List<CheckboxValue<T>> get value => _data;
}
