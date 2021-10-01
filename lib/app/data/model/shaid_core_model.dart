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
}
