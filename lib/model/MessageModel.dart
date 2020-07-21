class MessageModel {
  int id;
  String text;
  String date;
  int sender;
  int receiver;
  MessageModel(dynamic obj) {
    id = obj['message_id'];
    text = obj['text'];
    date = obj['date'];
    sender = obj['sender'];
    receiver = obj['receiver'];
  }

  MessageModel.fromMap(Map<String, dynamic> data) {
    id = data['message_id'];
    text = data['text'];
    date = data['date'];
    sender = data['sender'];
    receiver = data['receiver'];
  }

  Map<String, dynamic> toMap() => {
        'message_id': id,
        'text': text,
        'date': date,
        'sender': sender,
        'receiver': receiver
      };

  int get _id => id;
  String get _text => text;
  String get _date => date;
  int get _sender => sender;
  int get _receiver => receiver;
}
