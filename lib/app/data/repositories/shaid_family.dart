// import 'package:yoddhafoundation/app/constant/db_name.dart';
// import 'package:yoddhafoundation/app/core/service/db_helper.dart';
// import 'package:yoddhafoundation/app/data/model/shaid_family.dart';

// ShaidFamilyRepo shaidFamily = ShaidFamilyRepo();

// class ShaidFamilyRepo {
//   Future<List<ShaidFamily>> getAllShaidFamily() async {
//     try {
//       var dbClient = await con.db;
//       var res = await dbClient!.query(DBname.shaid);

//       List<ShaidFamily>? list = res.isNotEmpty
//           ? res.map((c) => ShaidFamily.fromMap(c)).toList()
//           : null;
//       if (list != null) {
//         return list;
//       } else {
//         return [];
//       }
//     } catch (error) {
//       return [];
//     }
//   }

//   Future<List<ShaidFamily>> getSingleShaidFamily(int shaidId) async {
//     try {
//       var dbClient = await con.db;
//       var res = await dbClient!
//           .query(DBname.shaid, where: 'shaid_id', whereArgs: [shaidId]);

//       List<ShaidFamily>? list = res.isNotEmpty
//           ? res.map((c) => ShaidFamily.fromMap(c)).toList()
//           : null;
//       if (list != null) {
//         return list;
//       } else {
//         return [];
//       }
//     } catch (error) {
//       return [];
//     }
//   }

//   Future<int> shaidFamilyInsert(ShaidFamily shaidFamily) async {
//     try {
//       var dbClient = await con.db;
//       int res = await dbClient!.insert(DBname.shaidFamily, shaidFamily.toMap());
//       return res;
//     } catch (error) {
//       return -1;
//     }
//   }

//   Future<int> shaidFamilyDelete(int id) async {
//     try {
//       var dbClient = await con.db;
//       int res = await dbClient!
//           .rawDelete('DELETE FROM ${DBname.shaidFamily} where id=?', [id]);
//       return res;
//     } catch (error) {
//       return -1;
//     }
//   }

//   Future<int> shaidFamilyupdate(ShaidFamily sahidFamily) async {
//     try {
//       var dbClient = await con.db;
//       int res = await dbClient!.update(DBname.shaidFamily, sahidFamily.toMap(),
//           where: "id = ?", whereArgs: [sahidFamily.id]);
//       return res;
//     } catch (error) {
//       return -1;
//     }
//   }
// }
