// import 'package:flutter_chat_ui/models/user_model.dart';

class Message{
  final String text;
  final DateTime date;
  final int sender;  
  final int receiver;
  Message(this.text, this.sender, this.receiver,this.date );
}