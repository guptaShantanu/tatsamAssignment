

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  static Database _db;

  factory DatabaseHelper()=>_instance;

  Future<Database> get db async{
    if(_db!=null)return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async{
    Directory dDoc = await getApplicationDocumentsDirectory();
    String path = join(dDoc.path,"tatsam.db");
    var db = await openDatabase(path,version: 2,onCreate: initializeDb);
    return db;
  }

  Future<void> initializeDb(Database db,int version)async{
    await createTable(db);
  }

  void createTable(Database db)async{
    await db.rawQuery("""
    CREATE TABLE wishlist(
    code TEXT,
    country TEXT,
    region TEXT
    )""");
  }

  Future<List> getWishlistItem()async{
    var dbClient = await db;
    return await dbClient.rawQuery("SELECT * FROM wishlist");
  }

  void addWishlistItem(String code,String region,String country)async{
    var dbClient = await db;
    await dbClient.rawQuery("INSERT INTO wishlist VALUES('$code','$country','$region')");
  }

  void removeWishlistItem(String code)async{
    var dbClient = await db;
    await dbClient.rawQuery("DELETE FROM wishlist WHERE code = '$code'");
  }


}
