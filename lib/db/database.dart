import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:tp/model/user.dart';

class DatabaseHelper {
  static final DatabaseHelper _itc = DatabaseHelper.internal();
  DatabaseHelper.internal();

  factory DatabaseHelper() => _itc;
  static Database? _db;
  Future<Database?> initdb() async {
    io.Directory dok = await getApplicationDocumentsDirectory();
    String path = join(dok.path, 'user.db');
    var ldb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ldb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''create table if not exists user(
      id integer primary key autoincrement,
      name text not null
    )''');
  }

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initdb();
    return _db;
  }

  Future<List<User>> getUser() async {
    var dbClient = await db;
    var user =
        (await dbClient!.query('user')).map((us) => User.fromMap(us)).toList();
    return user;
  }

  Future<int> insertData(User user) async {
    var dbc = await db;
    return await dbc!.insert('user', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(User user) async {
    var dbClient = await db;
    return await dbClient!
        .update('user', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('user', where: 'id = ?', whereArgs: [id]);
  }
}
