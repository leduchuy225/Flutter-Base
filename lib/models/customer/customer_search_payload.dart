import 'customer_search_default.dart';
import 'customer_search_set.dart';

class CustomerSearchPayload {
  CustomerSearchDefault? searchDefault;
  CustomerSearchSet? searchSet;
  int? coundLoad;

  CustomerSearchPayload({this.searchDefault, this.searchSet, this.coundLoad});

  factory CustomerSearchPayload.fromJson(Map<String, dynamic> json) {
    return CustomerSearchPayload(
      searchDefault: json['searchDefault'] == null
          ? null
          : CustomerSearchDefault.fromJson(
              json['searchDefault'] as Map<String, dynamic>,
            ),
      searchSet: json['searchSet'] == null
          ? null
          : CustomerSearchSet.fromJson(
              json['searchSet'] as Map<String, dynamic>,
            ),
      coundLoad: json['coundLoad'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'searchDefault': searchDefault?.toJson(),
    'searchSet': searchSet?.toJson(),
    'coundLoad': coundLoad,
  };
}
