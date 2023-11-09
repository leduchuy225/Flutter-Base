import 'package:equatable/equatable.dart';

class MySelectorModel with EquatableMixin {
  final String id;
  final String name;
  final String? description;

  MySelectorModel({
    this.description,
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id];
}

class MySelectorArguments {
  final String? id;
  final bool forceUpdate;
  final Future<List<MySelectorModel>> Function()? apiSource;

  MySelectorArguments({
    this.id,
    required this.apiSource,
    this.forceUpdate = false,
  }) : assert(id != null || apiSource != null);
}
