import 'package:equatable/equatable.dart';

class TreePlanted extends Equatable {
  final int id;
  final String name;
  final String description;
  final String date;
  final String tree;
  final int userId;
  final String local;

  const TreePlanted(
      {required this.id,
      required this.name,
      required this.description,
      required this.date,
      required this.tree,
      required this.userId,
      required this.local});

  factory TreePlanted.fromJson(Map<String, dynamic> json) {
    return TreePlanted(
        id: json['id'],
        name: json['name'],
        description: json['description'] ?? "",
        date: json['date'],
        tree: json['tree'],
        local: json['local'],
        userId: json['user_id']);
  }
  @override
  List<Object> get props => [id, name, description, date, tree, local, userId];
}
