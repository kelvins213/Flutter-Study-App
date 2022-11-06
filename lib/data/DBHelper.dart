import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled4/data/database_contents.dart';
import 'package:untitled4/domain/conteudos_das_materias.dart';

class DBHelper {

  static List subjectList = DatabaseContents.subjects_contents;

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "subjects11.db");
    print(path);

    Database database = await openDatabase(
        path,
        version: 1,
        onCreate: onCreate,
    );
    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async{
    String sql;
    sql = "create table SubjectAtributes(title varchar(40), iconName varchar(40),  titleAppBar varchar(40), imageLink varchar(300), concept varchar(500))";
    await db.execute(sql);
    await insertIntoDatas(db: db);
  }

  Future<FutureOr<void>> insertIntoDatas({
    required Database db,
  }) async{
    for (var i in subjectList) {
      for (var j in i) {
        dynamic json = j.toJson();
        await db.insert('SubjectAtributes', json);
      }
    }
  }
}
