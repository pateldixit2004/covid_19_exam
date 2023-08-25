import 'dart:io';

import 'package:covid_19_api_exam/screen/model/covide_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper
{
  static final DatabaseHelper helper=DatabaseHelper._();
  DatabaseHelper._();


  Database? database;
  final String? dbpath="database.db";
  final String? bookmard="bookmard";

  Future<Database?> checkDb()
  async {
    if(database!=null)
    {
      return database;
    }
    else
    {
      return await intiDb();
    }
  }

  Future<Database> intiDb()
  async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, dbpath);
    return await openDatabase(path,version: 1,onCreate: (db, version) async {
      await db.execute("CREATE TABLE $bookmard(id INTEGER PRIMARY KEY AUTOINCREMENT,con Text )");
    },);

  }
  Future<void> insertdb({CovidModel? model})
  async {

    database=await checkDb();
    await  database!.insert('$bookmard' ,{"con":model!.country });
  }
  Future<List<Map>> readDb()
  async {
    database=await checkDb();
    String quary="SELECT * FROM $bookmard";
    List<Map> l1=await database!.rawQuery(quary);
    return l1;
  }
}