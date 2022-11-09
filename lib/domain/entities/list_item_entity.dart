import 'package:spark_digital/imports.dart';

class ListItemEntity extends Equatable {
  final int id;
  final String name;

  const ListItemEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
