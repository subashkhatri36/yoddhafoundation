import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';
import 'package:yoddhafoundation/app/data/model/shaid_model.dart';

class CoreShaidModel {
  Sahid shaid;
  List<ShaidFamily>? shaidFamily;
  List<ShaidChildren>? shaidChildren;
  CoreShaidModel({
    required this.shaid,
    this.shaidFamily,
    this.shaidChildren,
  });

  Map<String, dynamic> toMap() {
    return {
      'shaid': shaid.toMap(),
      'shaidFamily': shaidFamily?.map((x) => x.toMap()).toList(),
      'shaidChildren': shaidChildren?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoreShaidModel.fromMap(Map<String, dynamic> map) {
    return CoreShaidModel(
      shaid: Sahid.fromMap(map['shaid']),
      shaidFamily: List<ShaidFamily>.from(
          map['shaidFamily']?.map((x) => ShaidFamily.fromMap(x))),
      shaidChildren: List<ShaidChildren>.from(
          map['shaidChildren']?.map((x) => ShaidChildren.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoreShaidModel.fromJson(String source) =>
      CoreShaidModel.fromMap(json.decode(source));

  CoreShaidModel copyWith({
    Sahid? shaid,
    List<ShaidFamily>? shaidFamily,
    List<ShaidChildren>? shaidChildren,
  }) {
    return CoreShaidModel(
      shaid: shaid ?? this.shaid,
      shaidFamily: shaidFamily ?? this.shaidFamily,
      shaidChildren: shaidChildren ?? this.shaidChildren,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoreShaidModel &&
        other.shaid == shaid &&
        listEquals(other.shaidFamily, shaidFamily) &&
        listEquals(other.shaidChildren, shaidChildren);
  }

  @override
  int get hashCode =>
      shaid.hashCode ^ shaidFamily.hashCode ^ shaidChildren.hashCode;

  @override
  String toString() =>
      'CoreShaidModel(shaid: $shaid, shaidFamily: $shaidFamily, shaidChildren: $shaidChildren)';
}
