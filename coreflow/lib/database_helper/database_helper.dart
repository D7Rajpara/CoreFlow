import 'package:coreflow/model/home_list_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  factory DatabaseHelper() => instance;
  DatabaseHelper._internal();

  static Database? _database;

  static const _dbName = 'app_database.db';
  static const _dbVersion = 1;
  static const tblHomeOption =
      "tblHomeOptions"; //#DR MARK: same name set in constant file

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tblHomeOption (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        inCart BooLEAN DEFAULT 0
      )
    ''');
  }

  Future<int> insertOptions(HomeListModel detail) async {
    final db = await database;
    return await db.insert(tblHomeOption, detail.toMap());
  }

  Future<List<HomeListModel>> getOptions() async {
    final db = await database;
    final result = await db.query(tblHomeOption);
    return result.map((row) => HomeListModel.fromMap(row)).toList();
  }

  Future<int> deleteOption(int id) async {
    final db = await database;
    return await db.delete(tblHomeOption, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateOption(HomeListModel detail) async {
    final db = await database;
    return await db.update(
      tblHomeOption,
      detail.toMap(),
      where: 'id = ?',
      whereArgs: [detail.id],
    );
  }
}
