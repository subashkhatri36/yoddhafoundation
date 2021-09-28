
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';
import 'package:yoddhafoundation/app/constant/db_name.dart';
import 'package:yoddhafoundation/app/core/service/db_helper.dart';

class ShaidChildrenRepo{

    Future<List<ShaidChildren>> getAllShaidFamily() async {
    try {
      var dbClient = await con.db;
      var res = await dbClient!.query(DBname.shaid);

      List<ShaidChildren>? list =
          res.isNotEmpty ? res.map((c) => ShaidChildren.fromMap(c)).toList() : null;
      if (list != null) {
        return list;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<int> shaidChildrenInsert(ShaidChildren shaidChildren)async{
    try {
      var dbClient = await con.db;
      int res = await dbClient!.insert(DBname.shaidChildren, shaidChildren.toMap());
      return res;
    } catch (error) {
      return -1;
    }
  }
  Future<int> shaidChildrenDelete(int id)async{
     try {
      var dbClient = await con.db;
      int res = await dbClient!
          .rawDelete('DELETE FROM ${DBname.shaidChildren} where id=?', [id]);
      return res;
    } catch (error) {
      return -1;
    }
  }

  Future<int> shaidChildrenupdate(ShaidChildren shaidChildren)async{
     try {
      var dbClient = await con.db;
      int res = await dbClient!.update(DBname.shaidChildren, shaidChildren.toMap(),
          where: "id = ?", whereArgs: [shaidChildren.id]);
      return res;
    } catch (error) {
      return -1;
    }
  }
}