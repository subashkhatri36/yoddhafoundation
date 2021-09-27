import 'package:yoddhafoundation/app/constant/db_name.dart';
import 'package:yoddhafoundation/app/core/service/db_helper.dart';
import 'package:yoddhafoundation/app/data/model/user.dart';

class UserRepo {
  Future<int> userInsert(User user) async {
    try {
      var dbClient = await con.db;
      int res = await dbClient!.insert(DBname.user, user.toMap());
      return res;
    } catch (error) {
      return -1;
    }
  }

  Future<int> userDelete() async {
    try {
      var dbClient = await con.db;
      int res = await dbClient!.rawDelete(
        'DELETE FROM ${DBname.user}',
      );
      return res;
    } catch (error) {
      return -1;
    }
  }
}


/*
  @override
  Future<Bhush> all() async {
    try {
      var dbClient = await con.db;
      var res = await dbClient.query(Dbname.Bhush_TABLE);
    
      List<Bhush> list =
          res.isNotEmpty ? res.map((c) => Bhush.fromMap(c)).toList() : null;
      if (list != null)
        return list[0];
      else
        return null;
    } catch (error) {
    
      return null;
    }
  }
  @override
  Future<int> up() async {
    try {
      var dbClient = await con.db;
      int res = await dbClient.update(Dbname.Bhush_TABLE, bhush.toMap(),
          where: "id = ?", whereArgs: [bhush.id]);
      return res;
    } catch (error) {
    
      return -1;
    }
  



 */