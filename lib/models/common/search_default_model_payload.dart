class SearchDefaultModelPayload {
  int? page;
  int? pageSize;
  String? searchString;
  bool? typeOrder;

  SearchDefaultModelPayload({
    this.page,
    this.pageSize,
    this.searchString,
    this.typeOrder,
  });

  factory SearchDefaultModelPayload.fromJson(Map<String, dynamic> json) {
    return SearchDefaultModelPayload(
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
