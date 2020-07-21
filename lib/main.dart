import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'package:messanger/Database/DbHelper.dart';
import 'package:messanger/model/MessageModel.dart';
import 'package:messanger/model/UserModel.dart';
import 'package:messanger/user.dart';
import 'message.dart';
import 'package:intl/intl.dart';

void main() => runApp(Messanger());
// void main() => runApp(Chat());

class Messanger extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<Messanger> {
  final List<String> photos = [
    'Assets/images/k.png',
    'Assets/images/Elean.JPG',
    'Assets/images/Ninja.jpg',
    'Assets/images/shkl.jfif',
    'Assets/images/shaba7.jpg',
    'Assets/images/medo.jfif'
  ];
  List<UserModel> friends = new List<UserModel>();
  // = [
  //   'قاف',
  //   'Salma',
  //   'Ninja',
  //   'عادل شكل',
  //   'أنا الشبح',
  //   'Medo Gad'
  // ];
  UserModel _me;
  final List<Color> status = [
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.grey[350],
    Colors.grey[350],
  ];
  final List<String> tags = ['1', '2', '3', '4', '5', '6'];
  final List<String> tags2 = ['a1', 'a2', 'a3', 'a4', 'a5', 'a6'];

  var myKey = GlobalKey<ScaffoldState>();
  bool flag = true;
  bool _color = true;

  DbHelper _helper;
  @override
  void initState() {
    super.initState();
    _helper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          key: myKey,
          body: FutureBuilder(
            future: _helper.loadUsers(),
            builder: (context, AsyncSnapshot snapshot) {
              // _helper.delete_users();
              // UserModel model = UserModel({'username': usernames[5]});
              UserModel userModel;
              if (_me == null) _me = UserModel.fromMap(snapshot.data[0]);
              for (int i = 1; i < snapshot.data.length; i++) {
                userModel = UserModel.fromMap(snapshot.data[i]);
                friends.add(userModel);
                // print(userModel.id.toString() + "  " + userModel.username);
              }
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 30)),
                    Expanded(
                      child: Container(
                        color: Colors.grey[350],
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              height: 43.0,
                              width: 43.0,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      _me = friends[1];
                                    });
                                    print(_me.username);
                                  },
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  backgroundColor: Colors.blueAccent,
                                  highlightElevation: 0,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          // color: Colors.red,
                                          image: new DecorationImage(
                                            fit: BoxFit.cover,
                                            image: new AssetImage(
                                                'Assets/images/JO.jpg'),
                                          )),
                                    ),
                                    Positioned(
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green,
                                          border: Border.all(
                                              color: Colors.grey[350],
                                              width: 3),
                                        ),
                                      ),
                                      bottom: 4,
                                      right: 8,
                                    ),
                                  ],
                                ),
                                Text(
                                  _me.username,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                            Container(
                              height: 43.0,
                              width: 43.0,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  backgroundColor: Colors.blueAccent,
                                  highlightElevation: 0,
                                  heroTag: "tag1",
                                  onPressed: () {
                                    // print("HELLOZ");
                                    // _helper.addUser(model);
                                    setState(() {
                                      _me = friends[0];
                                      print(_me.username);
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Friends",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: Container(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      // print(_color);
                                      setState(() {
                                        // _color = !_color;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Chat(
                                                      me: _me,
                                                      receiver: friends[index],
                                                    )));
                                        // _color = !_color;
                                      });
                                      print(_me.username +
                                          "   " +
                                          friends[index].username);
                                    },
                                    child: Container(
                                      height: 90,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey[200],
                                          ),
                                        ),
                                        color: _color
                                            ? Colors.white
                                            : Colors.blueAccent,
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 80,
                                            height: 80,
                                            child: FloatingActionButton(
                                              onPressed: () {
                                                // if (index == 3) {
                                                //   Navigator.push(
                                                //       context,
                                                //       MaterialPageRoute(
                                                //           builder: (context) => Chat()));
                                                //   print("إيه في إيه!");
                                                // }
                                                // print("Pressed$index");
                                              },
                                              heroTag: tags2[index],
                                              backgroundColor: Colors.white,
                                              // focusColor: Colors.green,
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      // color: Colors.white,
                                                      image:
                                                          new DecorationImage(
                                                        image: new AssetImage(
                                                            photos[index]),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    child: Container(
                                                      width: 20,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: status[
                                                            status.length -
                                                                1 -
                                                                index],
                                                        border: Border.all(
                                                            color: Colors.white,
                                                            width: 3),
                                                      ),
                                                    ),
                                                    bottom: 0,
                                                    right: 0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              friends[index].username,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                              },
                              itemCount: photos.length,
                            ),
                          )),
                        ],
                      ),
                      flex: 2,
                    ),
                  ],
                );
              }
            },
          )),
    );
  }
}

class Chat extends StatefulWidget {
  final UserModel me;
  final UserModel receiver;
  const Chat({
    Key key,
    this.me,
    this.receiver,
    username,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChatScreen(this.receiver, this.me);
  }
}

class ChatScreen extends State<Chat> {
  final UserModel receiver;
  final UserModel me;

  final msgText = TextEditingController();
  int messageCount = 0;
  List<Message> _messages = new List<Message>();
  ChatScreen(this.receiver, this.me);

  DbHelper _helper;
  @override
  void initState() {
    super.initState();
    _helper = DbHelper();
  }

  _messageBuilder(Message message, int sender) {
    bool isMe;
    sender == me.id ? isMe = true : isMe = false;
    Container msg = new Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.transparent, width: 5, style: BorderStyle.none),
            shape: BoxShape.rectangle,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0))
                : BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)),
            color: isMe ? Colors.blueAccent : Colors.grey[300]),
        margin: isMe
            ? EdgeInsets.only(bottom: 8.0, left: 80.0)
            : EdgeInsets.only(bottom: 8.0, right: 80.0),
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          children: <Widget>[
            Text(
              message.text,
              style: TextStyle(color: isMe ? Colors.white : Colors.black),
            ),
            Row(
              children: isMe
                  ? <Widget>[
                      Container(
                        // alignment:
                        // isMe ? Alignment.bottomLeft : Alignment.bottomRight,
                        child: Text(
                          // message.date.parse("2018-08-16T11:00:00.000Z").toString(),
                          DateFormat.jm().format(message.date),
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                      ),
                      Expanded(
                        child: Padding(padding: EdgeInsets.all(15)),
                      ),
                      Container(
                        // alignment:
                        // isMe ? Alignment.bottomRight : Alignment.bottomLeft,
                        child: Text(
                          "Me",
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                      ),
                    ]
                  : <Widget>[
                      Container(
                        // alignment:
                        // isMe ? Alignment.bottomRight : Alignment.bottomLeft,
                        child: Text(
                          receiver.username,
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 10),
                        ),
                      ),
                      Expanded(
                        child: Padding(padding: EdgeInsets.all(15)),
                      ),
                      Container(
                        // alignment:
                        // isMe ? Alignment.bottomLeft : Alignment.bottomRight,
                        child: Text(
                          DateFormat.jm().format(message.date),
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 10),
                        ),
                      ),
                    ],
            ),
          ],
        ));
    return msg;
  }

  _messageComposser() {
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(
            color: Colors.blueAccent,
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.blueAccent,
            icon: Icon(Icons.photo),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: msgText,
              decoration: InputDecoration.collapsed(
                  hintText: "Tap your message here.."),
            ),
          ),
          IconButton(
            color: Colors.blueAccent,
            icon: Icon(Icons.send),
            onPressed: () async {
              //Data Base
              MessageModel msgModel = MessageModel({
                'text': msgText.text,
                'date': DateTime.now().toString(),
                'sender': me.id,
                'receiver': receiver.id
              });

              _helper.addMessage(msgModel);
              // _helper.clear(sender)
              // print("Done $id");
              setState(() {
                if (msgText.text.isNotEmpty) {
                  _messages.add(new Message(
                      msgText.text, me.id, receiver.id, new DateTime.now()));
                  messageCount++;
                  // if (messageCount % 3 == 0) {
                  //   _messages.add(new Message(
                  //       "السلام عليكم و رحمة الله و بركااتووووو",
                  //       receiver.id,
                  //       me.id,
                  //       new DateTime.now()));
                  //   msgModel = MessageModel({
                  //     'text': "السلام عليكم و رحمة الله و بركااتووووو",
                  //     'date': DateTime.now().toString(),
                  //     'sender': receiver.id,
                  //     'receiver': me.id
                  //   });

                  //   _helper.addMessage(msgModel);
                  //   messageCount++;
                  // }
                  // if (messageCount % 5 == 0) {
                  //   _messages.add(new Message(
                  //       "Eh Fi Eh?!", receiver.id, me.id, new DateTime.now()));
                  //   msgModel = MessageModel({
                  //     'text': "Eh Fi Eh?!",
                  //     'date': DateTime.now().toString(),
                  //     'sender': receiver.id,
                  //     'receiver': me.id
                  //   });
                  //   _helper.addMessage(msgModel);

                  //   messageCount++;
                  // }
                  msgText.clear();
                }
              });
              // print(_messages.length);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () => {
                Navigator.pop(context, false),
              },
            ),
            title: Text(
              receiver.username,
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            // titleSpacing: MediaQuery.of(context).size.width*0.35,
          ),
          body: FutureBuilder(
              future: _helper.loadChat(me.id, receiver.id),
              builder: (context, AsyncSnapshot snapshot) {
                // List<dynamic> users = _helper.loadUsers();
                // print(users);
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  // _helper.clear(0);
                  if (_messages.length == 0) {
                    MessageModel msgModel;
                    for (int i = 0; i < snapshot.data.length; i++) {
                      msgModel = MessageModel.fromMap(snapshot.data[i]);
                      // bool isMe = (msgModel.sender == 0) ? true : false;
                      Message msg = new Message(msgModel.text, msgModel.sender,
                          msgModel.receiver, DateTime.parse(msgModel.date));
                      //msgModel.date)
                      _messages.add(msg);
                      messageCount++;
                      // print(_messages[i].text);
                    }
                  }
                  return Column(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 15.0),
                          reverse: true,
                          itemCount: this.messageCount,
                          itemBuilder: (context, index) => _messageBuilder(
                              _messages[_messages.length - index - 1],
                              _messages[_messages.length - index - 1].sender),
                        ),
                      )),
                      _messageComposser()
                    ],
                  );
                }
              })),
    );
  }
}
