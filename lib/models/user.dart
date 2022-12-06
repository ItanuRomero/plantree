import 'dart:convert';

class User {
  final int id;
  String email;
  String name;
  String token;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final user = User(
        id: json['user']['id'],
        email: json['user']['email'],
        name: json['user']['name'],
        token: json['token']);
    return user;
  }

  String toJson() {
    return jsonEncode(
      {'id': id, 'email': email, 'name': name, 'token': token},
    );
  }
}
