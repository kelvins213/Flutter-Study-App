import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled4/data/database_contents.dart';

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
    String path = join(databasePath, "subjects9.db");
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

    sql = "create table Title(titleID INTERGER PRIMARY KEY, title varchar(40))";
    await db.execute(sql);

    sql = "create table Icon(iconID INTERGER PRIMARY KEY, iconName varchar(40))";
    await db.execute(sql);

    sql = "create table TitleAppBar(titleappbarID INTERGER PRIMARY KEY, titleAppBar varchar(40))";
    await db.execute(sql);

    sql = "create table Image(imageID INTERGER PRIMARY KEY, imageLink varchar(300))";
    await db.execute(sql);

    sql = "create table Concept(conceptID INTERGER PRIMARY KEY, concept varchar(500))";
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
        sql = "insert into Title(titleID, title) values ('$count', '${j.titulo}');";
        await db.execute(sql);

        sql = "insert into Icon(iconID, iconName) values ('$count', '${j.icon}');";
        await db.execute(sql);

        sql = "insert into TitleAppBar(titleappbarID, titleAppBar) values ('$count', '${j.titleAppBar}');";
        await db.execute(sql);

        sql = "insert into Image(imageID, imageLink) values ('$count', '${j.imagem}');";
        await db.execute(sql);

        sql = "insert into Concept(conceptID, concept) values ('$count', '${j.conceito}');";
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
    //List<dynamic> titleList = [];
    dynamic title;
    dynamic icon;
    dynamic titleAppBar;
    dynamic imagem;
    dynamic conceito;

    for (var i = 0; i < totalLength; i++) {
      sql = 'SELECT * '
          'FROM Title '
          "WHERE titleID = '$i'; ";
      title = await db.rawQuery(sql);
      //await titleList.add(title);

      sql = 'SELECT * '
          'FROM Icon '
          "WHERE iconID = '$i'; ";
      icon = await db.rawQuery(sql);

      sql = 'SELECT * '
          'FROM TitleAppBar '
          "WHERE titleappbarID = '$i'; ";
      titleAppBar = await db.rawQuery(sql);

      sql = 'SELECT * '
          'FROM Image '
          "WHERE imageID = '$i'; ";
      imagem = await db.rawQuery(sql);

      sql = 'SELECT * '
          'FROM Concept '
          "WHERE conceptID = '$i'; ";
      conceito = await db.rawQuery(sql);
      //conceito é do tipo QueryResultSet
      //conceito[0] é do tipo RowQuery
      print(conceito[0]);
      print(conceito[0].runtimeType);


      //transformar o json para alguma coisa e usar para criar as variáveis
    }
  }
}
