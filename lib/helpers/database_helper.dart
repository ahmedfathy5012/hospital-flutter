import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:devida/blocs/models/abstractmodel.dart';


class DatabaseHelper {


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
    await db.execute("CREATE TABLE IF NOT EXISTS blood (id INTEGER PRIMARY KEY,title TEXT)");
    await db.execute("CREATE TABLE IF NOT EXISTS gender (id INTEGER PRIMARY KEY,title TEXT)");
    await db.execute("CREATE TABLE IF NOT EXISTS job (id INTEGER PRIMARY KEY,title TEXT)");
    await db.execute("CREATE TABLE IF NOT EXISTS nationality (id INTEGER PRIMARY KEY,title TEXT)");
    await db.execute("CREATE TABLE IF NOT EXISTS specialization (id INTEGER PRIMARY KEY,title TEXT)");
    await db.execute("CREATE TABLE IF NOT EXISTS role (id INTEGER PRIMARY KEY,title TEXT)");
  }

  Future<void> inset(String tableName ,var utilClass) async {
    var db = await this.database;
    var result = await db.execute(
        "INSERT INTO $tableName (`id`,`title`) VALUES (${utilClass.id},'${utilClass.title.toString()}')" );
    //return result;
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