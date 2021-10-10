import 'dart:convert';

/*
{
    "id": 3,
    "name": "Sudeep",
    "email": "bjr.sudeep@gmail.com",
    "role_id": "2",
    "email_verified_at": "2021-09-29T07:19:07.000000Z",
    "status": "1",
    "created_at": "2021-09-29T07:19:07.000000Z",
    "updated_at": "2021-09-29T07:19:07.000000Z"
}

 */

class User {
  final int id;
  final String name;
  final String email;
  final int roleId;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.roleId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'roleId': roleId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      roleId: map['roleId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
