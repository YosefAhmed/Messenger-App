// import 'package:flutter_chat_ui/models/user_model.dart';

class Message{
  final String text;
  final DateTime date;
  final bool sender;  
  Message(this.text, this.sender, this.date);
}