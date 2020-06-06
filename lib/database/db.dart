import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:devida/blocs/models/abstractmodel.dart';


class DatabaseHelper {

//  static Database _db;
//  static int get _version => 1;
//  static Future<void> init() async {
//    if (_db != null) { return; }
//    try {
//      String _path = await getDatabasesPath() + 'example';
//      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
//    }
//    catch(ex) {
//      print(ex);
//    }
//  }
//  static void onCreate(Database db, int version) async =>
//      await db.execute('CREATE TABLE todo_items (id INTEGER PRIMARY KEY NOT NULL, title STRING)');
//  static Future<List<Map<String, dynamic>>> query(String table) async => _db.query(table);
//  static Future<int> insert(String table, AbstractModel model) async =>
//      await _db.insert(table, model.toMap());
//  static Future<int> update(String table, AbstractModel model) async =>
//      await _db.update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);
//  static Future<int> delete(String table, AbstractModel model) async =>
//      await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database


  DatabaseHelper._createInstance(); // Named constructor to create i


  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {

    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = directory.path + 'utils.db';
    var utilsDB = await openDatabase(dbPath, version: 1, onCreate: _createDb);
    return utilsDB;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE IF NOT EXISTS blood ("
        "id INTEGER PRIMARY KEY,"
        "title TEXT,"
        ")");
    await db.execute("CREATE TABLE IF NOT EXISTS gender ("
        "id INTEGER PRIMARY KEY,"
        "title TEXT,"
        ")");
    await db.execute("CREATE TABLE IF NOT EXISTS job ("
        "id INTEGER PRIMARY KEY,"
        "title TEXT,"
        ")");
    await db.execute("CREATE TABLE IF NOT EXISTS nationality ("
        "id INTEGER PRIMARY KEY,"
        "title TEXT,"
        ")");
    await db.execute("CREATE TABLE IF NOT EXISTS specialization ("
        "id INTEGER PRIMARY KEY,"
        "title TEXT,"
        ")");
    await db.execute("CREATE TABLE IF NOT EXISTS anesthetic ("
        "id INTEGER PRIMARY KEY,"
        "title TEXT,"
        ")");
  }

  Future<int> inset(var utilClass) async {
     var db = await this.database;
    var result = await db.rawInsert(
        "INSERT INTO Customer (id,title)"
        " VALUES (${utilClass.id},${utilClass.title})");
    return result;
  }

   Future<List> getAll(String tableName) async {
     var db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $tableName');
    return result.toList();
  }

  Future<void> truncateTable(String tableName)async{
    var db = await this.database;
    var result = await db.execute('TRUNCATE TABLE $tableName');
    //return result;
  }

//  Future<Customer> getOne(int id) async {
//    var results = await database.rawQuery('SELECT * FROM Customer WHERE id = $id');
//
//    if (results.length > 0) {
//      return new Customer.fromMap(results.first);
//    }
//
//    return null;
//  }
//
//  Future<int> updateCustomer(Customer customer) async {
//    return await database.rawUpdate(
//        'UPDATE Customer SET first_name = ${customer.firstName} WHERE id = ${customer.id}'
//    );
//  }
//
//  Future<int> deleteCustomer(int id) async {
//    return await db.rawDelete('DELETE FROM Customer WHERE id = $id');
//  }



}