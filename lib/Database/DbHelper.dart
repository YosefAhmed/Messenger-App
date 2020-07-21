import 'dart:io';

import 'package:messanger/main.dart';
import 'package:messanger/model/MessageModel.dart';
import 'package:messanger/message.dart';
import 'package:messanger/model/UserModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database _db;

  Future<Database> createDB() async {
    // Directory dir = await getApplicationDocumentsDirectory();
    // print(dir.path);
    if (_db != null) {
      return _db;
    }
    String path = join(await getDatabasesPath(), 'messages.db');

    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      
      //create tables
      db.execute(
          'create table message(message_id integer primary key autoincrement, text varchar(100), date varchar(50), sender integer, receiver integer)');
      db.execute(
          'create table user(user_id integer primary key autoincrement, username varchar(50))');
    });
    return _db;
  }

  void addMessage(MessageModel msg) async {
    Database db = await createDB();
    db.insert('message', msg.toMap());
  }

  Future<List> loadChat(int sender, int receiver) async {
    // print("chat loaded");
    Database db = await createDB();
    return db.query('message',
        where: 'sender=? and "receiver"=? OR sender = ? and "receiver"=?', whereArgs: [sender, receiver,receiver,sender]);
  }

  Future<int> clear(int sender) async {
    Database db = await createDB();
    return db.delete('message');
        // where: 'sender = ?', whereArgs: [sender]);
    // return db.rawDelete('DELETE  FROM message where ');
  }

  Future<int> addUser(UserModel user) async {
    Database db = await createDB();
    // print("--->"+user.username);
    return db.insert('user', user.toMap());
    // return db.rawInsert('insert into user (username) values(?)',[username]);
  }

    Future<List> loadUsers() async {
    Database db = await createDB();
    return db.query('user');
    // return db.query('user', where: 'username = "Yousef Ahmed"');
  }

    Future<int> delete_users() async {
    Database db = await createDB();
    return db.delete('user');
    // return db.rawDelete('DELETE  FROM message where ');
  }
}
