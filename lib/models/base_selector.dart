class MySelectorModel {
  final String id;
  final String name;
  final String? description;

  MySelectorModel({
    this.description,
    required this.id,
    required this.name,
  });
}

class MySelectorArguments {
  final bool forceUpdate;
  final Future<List<MySelectorModel>> Function() apiSource;

  MySelectorArguments({
    required this.apiSource,
    this.forceUpdate = false,
  });
}
