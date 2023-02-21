import 'dart:io';
import 'package:flutter_application_11/models/to_do_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  String tableName = 'to_do_list';
  String id = 'id';
  String title = 'title';
  String date = 'date';
  String status = 'status';
  String description = 'description';

  static DataBaseHelper? _dataBaseHelper;
  DataBaseHelper._createInstance();
  factory DataBaseHelper() {
    if (_dataBaseHelper == null) {
      _dataBaseHelper = DataBaseHelper._createInstance();
    }
    return _dataBaseHelper!;
  }

  Database? _database;
  get database async {
    if (_database == null) {
      _database = await initializationDataBase();
    }
    return _database;
  }

  Future<Database> initializationDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "my_to_do_list_data_base.db";
    return await openDatabase(path, version: 1, onCreate: _create);
  }

  _create(Database database, int version) async {
    return await database.execute(
        "CREATE TABLE $tableName ($id INTEGER PRIMARY KEY AUTOINCREMENT, $title text,$date text,$status text,$description text)");
  }

  Future<int> insert(ToDoModel toDoModel) async {
    Database database = await this.database;
    var result = database.insert(tableName, toDoModel.toMap());
    print('Data Inserted');
    return result;
  }
}
