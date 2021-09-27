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
      'shaid_id': shaidId,
      'name': name,
      'relation': relation,
      'dob': dob.millisecondsSinceEpoch,
      'education_qualification': educationQualification,
      'currently_studying_level': currentlyStudyingLevel,
      'faculty': faculty,
      'occupation': occupation,
      'financial_status': financialStatus,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory ShaidChildren.fromMap(Map<String, dynamic> map) {
    return ShaidChildren(
      id: map['id'],
      shaidId: map['shaid_id'],
      name: map['name'],
      relation: map['relation'],
      dob: DateTime.fromMillisecondsSinceEpoch(map['dob']),
      educationQualification: map['education_qualification'],
      currentlyStudyingLevel: map['currently_studying_level'],
      faculty: map['faculty'],
      occupation: map['occupation'],
      financialStatus: map['financial_status'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShaidChildren.fromJson(String source) => ShaidChildren.fromMap(json.decode(source));
}

