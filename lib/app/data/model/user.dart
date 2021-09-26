
import 'dart:convert';

class User {
   final int id;
  final String name;
  final String email;
  final int roleId;
 final DateTime emailVerifiedAt;
  final String password;
  final String rememberToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({required this.id,required this.name,required this.email,required this.roleId,required this.emailVerifiedAt,required this.password,required this.rememberToken,required this.createdAt,required this.updatedAt});


  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'roleId': roleId,
      'emailVerifiedAt': emailVerifiedAt.millisecondsSinceEpoch,
      'password': password,
      'rememberToken': rememberToken,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      roleId: map['roleId'],
      emailVerifiedAt: DateTime.fromMillisecondsSinceEpoch(map['emailVerifiedAt']),
      password: map['password'],
      rememberToken: map['rememberToken'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}