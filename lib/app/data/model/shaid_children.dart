import 'dart:convert';

class ShaidChildren {
  final int id;
  final int shaidId;
  final String name;
  final String relation;
  final DateTime dob;
  final String educationQualification;
  final String currentlyStudyingLevel;
  final String faculty;
  final String occupation;
  final String financialStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShaidChildren({required this.id,required this.shaidId,required this.name,required this.relation,required this.dob,required this.educationQualification,required this.currentlyStudyingLevel,required this.faculty,required this.occupation,required this.financialStatus,required this.createdAt,required this.updatedAt});
  


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'shaidId': shaidId,
      'name': name,
      'relation': relation,
      'dob': dob.millisecondsSinceEpoch,
      'educationQualification': educationQualification,
      'currentlyStudyingLevel': currentlyStudyingLevel,
      'faculty': faculty,
      'occupation': occupation,
      'financialStatus': financialStatus,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory ShaidChildren.fromMap(Map<String, dynamic> map) {
    return ShaidChildren(
      id: map['id'],
      shaidId: map['shaidId'],
      name: map['name'],
      relation: map['relation'],
      dob: DateTime.fromMillisecondsSinceEpoch(map['dob']),
      educationQualification: map['educationQualification'],
      currentlyStudyingLevel: map['currentlyStudyingLevel'],
      faculty: map['faculty'],
      occupation: map['occupation'],
      financialStatus: map['financialStatus'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShaidChildren.fromJson(String source) => ShaidChildren.fromMap(json.decode(source));
}

