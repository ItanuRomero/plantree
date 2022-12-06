import 'package:equatable/equatable.dart';

class TreePlanted extends Equatable {
  final int id;
  final String name;
  final String description;
  final String date;
  final int treeId;
  final int userId;
  final int localId;

  const TreePlanted(
      {required this.id,
      required this.name,
      required this.description,
      required this.date,
      required this.treeId,
      required this.userId,
      required this.localId});

  factory TreePlanted.fromJson(Map<String, dynamic> json) {
    return TreePlanted(
        id: json['id'],
        name: json['name'],
        description: json['description'] ?? "",
        date: json['date'],
        treeId: json['tree_id'],
        localId: json['local_id'],
        userId: json['user_id']);
  }
  @override
  List<Object> get props =>
      [id, name, description, date, treeId, localId, userId];
}
