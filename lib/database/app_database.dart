import 'package:path/path.dart';
import 'package:projeto2/database/dao/contact_dao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.dp');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tablesql);
    },
    version: 1,
  );
}
