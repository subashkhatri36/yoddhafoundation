import 'dart:convert';

class ShaidChildren {
  int? id;
  int? shaidId;
  final String name;
  final String relation;
  final DateTime dob;
  String token;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShaidChildren(
      {this.id,
      this.token = '',
      this.shaidId,
      required this.name,
      required this.relation,
      required this.dob,
      required this.createdAt,
      required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'shaid_id': shaidId,
      'name': name,
      'relation': relation,
      'token': token,
      'dob': dob.millisecondsSinceEpoch,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory ShaidChildren.fromMap(Map<String, dynamic> map) {
    return ShaidChildren(
      id: map['id'],
      shaidId: map['shaid_id'],
      name: map['name'],
      token: map['token'],
      relation: map['relation'],
      dob: DateTime.fromMillisecondsSinceEpoch(map['dob']),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShaidChildren.fromJson(String source) =>
      ShaidChildren.fromMap(json.decode(source));
}
