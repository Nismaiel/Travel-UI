import 'dart:core';
import 'dart:core' as prefix0;
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Bookings.dart';
import 'package:path_provider/path_provider.dart';
class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String PRICE = 'price';
  static const String IMAGE = 'image';
  static const String RATE= 'rate';
  static const String START= 'start';
  static const String END='end';
  static const String TABLE = 'book';
  static const String DB_Name = 'book.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory DocumentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(DocumentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $NAME TEXT, $PRICE INTEGER,$IMAGE TEXT,$RATE INTEGER,$START TEXT,$END TEXT)");
  }

  Future<Bookingdb> save(Bookingdb book) async {
    var dbClient = await db;
    book.id = await dbClient.insert(TABLE, book.toMap());

    return book;
  }

  Future<List<Bookingdb>> getBookings() async {
    var dbClient = await db;
    List<Map> maps =
    await dbClient.query(TABLE, columns: [ID, NAME, PRICE, IMAGE,RATE,START,END]);
    List<Bookingdb> crt = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        crt.add(Bookingdb.fromMap(maps[i]));
      }
    }
    return crt;
  }

  Future getTotal() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT SUM(price) FROM $TABLE");
    int  value = result[0]["SUM(price)"];
    if(value==null){
      return value=0;
    } else
      return value.toString();
  }


  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID=?', whereArgs: [id]);
  }
  Future <int> clear(int id)async{
    var dbClient=await db;
    return await dbClient.delete(TABLE);
  }


  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
