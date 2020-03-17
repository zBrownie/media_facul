import 'package:projetomedia/dbsql/database_creator.dart';
import 'package:projetomedia/dbsql/media.dart';

class ServiceMedia {
  static Future<List<Media>> getAllTodos() async {
    final sql = '''
    SELECT * FROM ${DataBaseCreator.mediaTable}
    WHERE ${DataBaseCreator.isDeleted} == 0
    ''';

    final data = await db.rawQuery(sql);
    List<Media> medias = List();

    for (final node in data) {
      final media = Media.fromJson(node);
      medias.add(media);
    }

    return medias;
  }

  static Future<Media> getMedia(int id) async {
    // final sql = '''
    // SELECT * FROM ${DataBaseCreator.mediaTable}
    // WHERE ${DataBaseCreator.id} == $id
    // ''';
    // final data = await db.rawQuery(sql);

    final sql = ''' SELECT * FROM ${DataBaseCreator.mediaTable}
    WHERE ${DataBaseCreator.id} == ?''';

    List<dynamic> params = [id];
    final data = await db.rawQuery(sql, params);

    final media = Media.fromJson(data.first);

    return media;
  }

  static Future<void> addMedia(Media media) async {
    // final sql = '''
    // INSERT INTO ${DataBaseCreator.mediaTable}
    // (
    //   ${DataBaseCreator.id},
    //   ${DataBaseCreator.materia},
    //   ${DataBaseCreator.nota1},
    //   ${DataBaseCreator.nota2},
    //   ${DataBaseCreator.media},
    //   ${DataBaseCreator.isDeleted}
    // )
    // VALUES
    // (
    //   ${media.id},
    //   ${media.materia},
    //   ${media.nota1},
    //   ${media.nota2},
    //   ${media.media},
    //   ${media.isDeleted ? 1 : 0}
    // )
    // ''';

    final sql = '''
    INSERT INTO ${DataBaseCreator.mediaTable}
    (
      ${DataBaseCreator.id},
      ${DataBaseCreator.materia},
      ${DataBaseCreator.nota1},
      ${DataBaseCreator.nota2},
      ${DataBaseCreator.media},
      ${DataBaseCreator.isDeleted}
    )
    VALUES (?,?,?,?,?,?)
    ''';
    List<dynamic> params = [
      media.id,
      media.materia,
      media.nota1,
      media.nota2,
      media.media,
      media.isDeleted ? 1 : 0
    ];

    final result = await db.rawInsert(sql, params);

    DataBaseCreator.databaseLog('Add media', sql, null, result, params);
  }

  static Future<void> deleteMedia(Media media) async {
    // final sql = '''
    // UPDATE ${DataBaseCreator.mediaTable}
    // SET ${DataBaseCreator.isDeleted} = 1
    // WHERE ${DataBaseCreator.id}==${media.id}
    // ''';

    final sql = '''UPDATE ${DataBaseCreator.mediaTable}
    SET ${DataBaseCreator.isDeleted} = 1
    WHERE ${DataBaseCreator.id} = ? ''';
    List<dynamic> params = [media.id];
    final result = await db.rawUpdate(sql, params);

    DataBaseCreator.databaseLog('Delete media', sql, null, result, params);
  }

  static Future<void> updateMedia(Media media) async {
    // final sql = '''
    // UPDATE ${DataBaseCreator.mediaTable}
    // SET ${DataBaseCreator.materia} = ${media.materia},
    // ${DataBaseCreator.nota1} = ${media.nota1},
    // ${DataBaseCreator.nota2} = ${media.nota2},
    // ${DataBaseCreator.media} = ${media.media}
    // WHERE ${DataBaseCreator.id}==${media.id}
    // ''';

    final sql = '''
    UPDATE ${DataBaseCreator.mediaTable}
    SET ${DataBaseCreator.materia} = ?,
    ${DataBaseCreator.nota1} = ?,
    ${DataBaseCreator.nota2} = ?,
    ${DataBaseCreator.media} = ?
    WHERE ${DataBaseCreator.id}==?
    ''';

    List<dynamic> params = [media.materia, media.nota1, media.nota2, media.id];

    final result = await db.rawUpdate(sql, params);

    DataBaseCreator.databaseLog('Update media', sql, null, result,params);
  }

  static Future<int> mediasCount() async {
    final data = await db
        .rawQuery('''SELECT COUNT(*) FROM ${DataBaseCreator.mediaTable}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}
