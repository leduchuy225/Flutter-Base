import 'package:equatable/equatable.dart';

class MySelectorModel with EquatableMixin {
  final dynamic id;
  final String name;
  final String? description;

  MySelectorModel({this.description, required this.id, required this.name});

  @override
  List<Object?> get props => [id];
}
