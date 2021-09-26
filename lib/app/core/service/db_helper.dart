import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class YoddhaDatabase{
  YoddhaDatabase.internal();
  static final YoddhaDatabase instance = new YoddhaDatabase.internal();
  factory YoddhaDatabase() => instance;
  static final tableName = "sahid_record";
  static final _version = 1;
  static Database? _db;

  Future<Database?> get db async{
    if(_db !=null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, "yoddha");

    var openDb = await openDatabase(dbPath, version: _version,
    onCreate: (Database db, int version) async{
      await db.execute("""
      CREATE TABLE $tableName(
        sahid_id INTEGER PRIMARY KEY AUTOINCREMENT,
        image TEXT,
        sahid_name TEXT,
        gender TEXT,
        death_date TEXT,
        prades TEXT,
        jilla TEXT,
        taha TEXT,
        odaa TEXT,
        tole TEXT,
        death_place TEXT,
        sangathan_jimmewari TEXT,
        family_name TEXT,
        relation TEXT,
        age TEXT,
        pesa TEXT,
        arthik_awastha TEXT,
        remarks TEXT,
        child_name TEXT,
        child_relation TEXT,
        birth_date TEXT,
        education TEXT,
        child_job TEXT,
        edu_standard TEXT,
        child_arthik TEXT)""");
      },
      onUpgrade: (Database db, int oldversion, int newversion)async{
        if(oldversion<newversion){
          print("version upgrade");
        }
      }
    );
    print("db initialize");
    return openDb;
  }
}