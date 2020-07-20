import 'package:messanger/main.dart';
import 'package:messanger/model/MessageModel.dart';
import 'package:messanger/message.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database _db;

  Future<Database> createDB() async {
    if (_db != null) {
      return _db;
    }
    String path = join(await getDatabasesPath(), 'messages.db');

    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      //create tables
      db.execute(
          'create table message(message_id integer primary key autoincrement, text varchar(100), date varchar(50), sender integer)');
      db.execute('create table Account(account_id integer primary key autoincrement, username varchar(50))');
    });
    return _db;
  }
  Future<int> createChat(MessageModel msg) async{
    Database db = await createDB();
    return db.insert('message', msg.toMap()); 
  }

  Future<List> loadChat () async{
    Database db = await createDB();
    return db.query('message');
  }
  
  Future<int> clear (int id) async{
    Database db = await createDB();
    return db.rawDelete('DELETE  FROM message');
  }
  
}
