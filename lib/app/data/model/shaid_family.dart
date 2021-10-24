import 'dart:convert';

class ShaidFamily {
  int? id;
  int? shaidId;
  final String name;
  final String relation;
  String token;
  final int age;

  final DateTime createdAt;
  final DateTime updatedAt;

  ShaidFamily(
      {this.id,
      this.token = '',
      this.shaidId,
      required this.name,
      required this.relation,
      required this.age,
      required this.createdAt,
      required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'shaid_id': shaidId,
      'name': name,
      'relation': relation,
      'age': age,
      'token': token,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory ShaidFamily.fromMap(Map<String, dynamic> map) {
    return ShaidFamily(
      id: map['id'],
      shaidId: map['shaid_id'],
      name: map['name'],
      relation: map['relation'],
      age: map['age'],
      token: map['token'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShaidFamily.fromJson(String source) =>
      ShaidFamily.fromMap(json.decode(source));
}
