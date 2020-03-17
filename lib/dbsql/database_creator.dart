import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

Database db;

class DataBaseCreator {
  static const mediaTable = 'medias';
  static const id = 'id';
  static const materia = 'materia';
  static const nota1 = 'nota1';
  static const nota2 = 'nota2';
  static const media = 'media';
  static const isDeleted = 'isDeleted';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult,
      List<dynamic> params]) {
    print(functionName);
    print(sql);

    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }

    if (params != null) {
      print(params);
    }
  }

  Future<void> createMediaTable(Database db) async {
    final medialSql = '''CREATE TABLE $mediaTable
    (
      $id INTERGER PRIMARY KEY,
      $materia TEXT,
      $nota1 REAL,
      $nota2 REAL,
      $media REAL,
      $isDeleted BIT NOT NULL
    )''';

    await db.execute(medialSql);
  }

  Future<String> getDataBasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    if (await Directory(dirname(path)).exists()) {
      // await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDataBase() async {
    final path = await getDataBasePath('media_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);

    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createMediaTable(db);
  }
}
