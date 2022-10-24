import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled4/data/database_contents.dart';
import 'package:untitled4/domain/JsonData.dart';

class DBHelper {

  static List subjectList = DatabaseContents.subjects_contents;

  static int portugueseLength = DatabaseContents.portuguese_contents.length;
  static int mathsLength = DatabaseContents.maths_contents.length;
  static int historyLength = DatabaseContents.history_contents.length;
  static int geografyLength = DatabaseContents.geografy_contents.length;
  static int philosophyLength = DatabaseContents.philosophy_contents.length;
  static int sociologyLength = DatabaseContents.sociology_contents.length;
  static int physicalLength = DatabaseContents.physical_contents.length;
  static int chemistryLenght = DatabaseContents.chemistry_contents.length;
  static int biologyLenght = DatabaseContents.biology_contents.length;
  static int programmingLenght = DatabaseContents.programming_contents.length;
  static int businessLenght = DatabaseContents.business_contents.length;

  static int totalLenght = portugueseLength + mathsLength + historyLength + geografyLength + philosophyLength + sociologyLength + physicalLength + chemistryLenght + biologyLenght + programmingLenght + businessLenght;

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "subjects4.db");
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

    sql = "create table SubjectAtributes(id INTERGER PRIMARY KEY, title varchar(40), iconName varchar(40),  titleAppBar varchar(40), imageLink varchar(300), concept varchar(500))";
    await db.execute(sql);

    await insertIntoDatas(db: db);
    await fullFillObjects(totalLength: totalLenght, db: db);
  }

  Future<FutureOr<void>> insertIntoDatas({
    required Database db,
  }) async{
    String sql;
    int count = 0;

    for (var i in subjectList) {
      for (var j in i) {
        sql = "insert into SubjectAtributes(id, title, iconName, titleAppBar, imageLink, concept) VALUES ('$count', '${j.titulo}', '${j.icon}', '${j.titleAppBar}', '${j.imagem}', '${j.conceito}');";
        await db.execute(sql);
        count++;
      }
    }
  }

  Future<void> fullFillObjects({
    required int totalLength,
    required Database db,
  }) async {

    String sql;
    dynamic subject;
    for (var i = 0; i < totalLength; i++) {
      sql = 'SELECT * '
          'FROM SubjectAtributes '
          "WHERE id = '$i'; ";
      subject = await db.rawQuery(sql);
      //error type 'QueryResultSet' is not a subtype of type 'Map<String, dynamic>'
      print(subject);
      Json.fromJson(subject);
    }
  }
}
