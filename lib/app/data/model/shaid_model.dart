
import 'dart:convert';

class Sahid {
  final int id;
  final String name;
  final String gender;
  final String district;
  final String state;
  final String ward;
  final String tole;
  final String image;
  final DateTime deathdate;
  final DateTime deathplace;
  final String responsible;
   final DateTime createdAt;
  final DateTime updatedAt;

  Sahid({required this.id,required this.name,required this.gender,required this.district,required this.state,required this.ward,required this.tole,required this.image,required this.deathdate,required this.deathplace,required this.responsible,required this.createdAt,required this.updatedAt,});

  


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'state': state,
      'district': district,
      'ward': ward,
      'tole': tole,
      'image': image,
      'death_date': deathdate.millisecondsSinceEpoch,
      'death_place': deathplace.millisecondsSinceEpoch,
      'responsible': responsible,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Sahid.fromMap(Map<String, dynamic> map) {
    return Sahid(
      id: map['id'],
      name: map['name'],
      gender: map['gender'],
      state: map['state'],
      district: map['district'],
      ward: map['ward'],
      tole: map['tole'],
      image: map['image'],
      deathdate: DateTime.fromMillisecondsSinceEpoch(map['death_date']),
      deathplace: DateTime.fromMillisecondsSinceEpoch(map['death_place']),
      responsible: map['responsible'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sahid.fromJson(String source) => Sahid.fromMap(json.decode(source));
}

