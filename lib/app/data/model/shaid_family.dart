
import 'dart:convert';

class ShaidFamily {
  final int id;
  final int shaidId;
  final String name;
  final String relation;
  final int age;
 final String occupation;
  final String financialStatus;
  final String remarks;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShaidFamily({required this.id,required this.shaidId,required this.name,required this.relation,required this.age,required this.occupation,required this.financialStatus,required this.remarks,required this.createdAt,required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'shaidId': shaidId,
      'name': name,
      'relation': relation,
      'age': age,
      'occupation': occupation,
      'financialStatus': financialStatus,
      'remarks': remarks,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory ShaidFamily.fromMap(Map<String, dynamic> map) {
    return ShaidFamily(
      id: map['id'],
      shaidId: map['shaidId'],
      name: map['name'],
      relation: map['relation'],
      age: map['age'],
      occupation: map['occupation'],
      financialStatus: map['financialStatus'],
      remarks: map['remarks'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShaidFamily.fromJson(String source) => ShaidFamily.fromMap(json.decode(source));
  }
