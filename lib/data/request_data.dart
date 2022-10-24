import 'package:sqflite/sqlite_api.dart';
import 'package:untitled4/domain/JsonData.dart';

class Request{

  Future<void> fullFillObjects({
    required Database db,
    required int count,
    required List<Json> list,
  }) async {
    String sql;
    sql = 'SELECT * '
        'FROM SubjectAtributes '
        "WHERE id = '$count'; ";
    final subject = await db.rawQuery(sql);
    Json objectSub = Json.fromJson(subject[0]);
    list.add(objectSub);
  }

  buildSubjectList({
    required listLength,
    required String appBarName,
  }){
    List list = [];

    for (var i = 0; i < listLength; i++) {

    }

    return list;
  }
}
