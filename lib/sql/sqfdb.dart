import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    String databasepath = await getDatabasesPath();
    String fullpath = join(databasepath, 'homeworklist.db');
    Database mydb =
        await openDatabase(fullpath, onCreate: _onCreate, version: 1);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
  CREATE TABLE "lists" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,  
  "title" TEXT NOT NULL,
  "content" TEXT NOT NULL 
  )
''');
    batch.commit();
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  deleteDataBase() async {
    String databasepath = await getDatabasesPath();
    String fullpath = join(databasepath, 'homeworklist.db');
    await deleteDatabase(fullpath);
  }
}
