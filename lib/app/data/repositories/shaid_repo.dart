import 'package:yoddhafoundation/app/constant/db_name.dart';
import 'package:yoddhafoundation/app/core/service/db_helper.dart';
import 'package:yoddhafoundation/app/data/model/shaid_model.dart';

class ShaidRepo {
  Future<List<Sahid>> getAllShaid() async {
    try {
      var dbClient = await con.db;
      var res = await dbClient!.query(DBname.shaid);

      List<Sahid>? list =
          res.isNotEmpty ? res.map((c) => Sahid.fromMap(c)).toList() : null;
      if (list != null) {
        return list;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<int> shaidInsert(Sahid shaid) async {
    try {
      var dbClient = await con.db;
      int res = await dbClient!.insert(DBname.shaid, shaid.toMap());
      return res;
    } catch (error) {
      return -1;
    }
  }

  Future<int> shaidDelete(int id) async {
    try {
      var dbClient = await con.db;
      int res = await dbClient!
          .rawDelete('DELETE FROM ${DBname.user} where id=?', [id]);
      return res;
    } catch (error) {
      return -1;
    }
  }

  Future<int> shaidupdate(Sahid shaid) async {
    try {
      var dbClient = await con.db;
      int res = await dbClient!.update(DBname.shaid, shaid.toMap(),
          where: "id = ?", whereArgs: [shaid.id]);
      return res;
    } catch (error) {
      return -1;
    }
  }
}
