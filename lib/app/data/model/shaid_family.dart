import 'dart:convert';

class ShaidFamily {
  int? id;
  int? shaidId;
  final String name;
  final String relation;
  String token;
  final int age;
  final String occupation;
  final String financialStatus;
  final String remarks;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShaidFamily(
      {this.id,
      this.token = '',
      this.shaidId,
      required this.name,
      required this.relation,
      required this.age,
      required this.occupation,
      required this.financialStatus,
      required this.remarks,
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
      'occupation': occupation,
      'financial_status': financialStatus,
      'remarks': remarks,
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
      occupation: map['occupation'],
      financialStatus: map['financial_status'],
      remarks: map['remarks'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShaidFamily.fromJson(String source) =>
      ShaidFamily.fromMap(json.decode(source));
}
