class CustomerSearchDefault {
  int? page;
  int? pageSize;
  String? searchString;
  bool? typeOrder;

  CustomerSearchDefault({
    this.page,
    this.pageSize,
    this.searchString,
    this.typeOrder,
  });

  factory CustomerSearchDefault.fromJson(Map<String, dynamic> json) {
    return CustomerSearchDefault(
      page: json['page'] as int?,
      pageSize: json['pageSize'] as int?,
      searchString: json['searchString'] as String?,
      typeOrder: json['TypeOrder'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'page': page,
    'pageSize': pageSize,
    'searchString': searchString,
    'TypeOrder': typeOrder,
  };
}
