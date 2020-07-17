import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'message.dart';

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
  final List<String> usernames = [
    'قاف',
    'Salma',
    'Ninja',
    'عادل شكل',
    'أنا الشبح',
    'Medo Gad'
  ];
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: myKey,
        body: Column(
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
                          onPressed: null,
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
                                    image:
                                        new AssetImage('Assets/images/JO.jpg'),
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
                                      color: Colors.grey[350], width: 3),
                                ),
                              ),
                              bottom: 4,
                              right: 8,
                            ),
                          ],
                        ),
                        Text(
                          "Yousef Ahmed",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
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
                          onPressed: () {},
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Recent",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                          width: 90,
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  FloatingActionButton(
                                    onPressed: () {
                                      // if (photos.length - 1 - index == 3) {
                                      //   Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) => Chat()));
                                      //   print("إيه في إيه!");
                                      // }
                                      // print("Pressed $index");
                                    },
                                    heroTag: tags[index],
                                    backgroundColor: Colors.white,
                                    hoverColor: Colors.green,
                                    splashColor: Colors.orange,
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        // color: Colors.white,
                                        image: new DecorationImage(
                                          image: new AssetImage(photos[
                                              photos.length - 1 - index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: status[index],
                                        border: Border.all(
                                            color: Colors.white, width: 3),
                                      ),
                                    ),
                                    bottom: 0,
                                    right: 0,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  usernames[usernames.length - 1 - index],
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      // separatorBuilder: (context, index) => Divider(),
                      itemCount: photos.length),
                ),
              ],
            )),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Friends",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Container(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              print(_color);
                              setState(() {
                                // _color = !_color;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Chat(
                                              username: usernames[index],
                                            )));
                                // _color = !_color;
                              });
                              print(usernames[index]);
                            },
                            child: Container(
                              height: 90,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[200],
                                  ),
                                ),
                                color:
                                    _color ? Colors.white : Colors.blueAccent,
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
                                              image: new DecorationImage(
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
                                                    status.length - 1 - index],
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
                                      usernames[index],
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
        ),
      ),
    );
  }
}

class Chat extends StatefulWidget {
  final String username;

  const Chat({Key key, this.username}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChatScreen(this.username);
  }
}

class ChatScreen extends State<Chat> {
  final String username;
  final msgText = TextEditingController();
  int messageCount = 0;
  Message _msg;
  List<Message> _messages = new List<Message>();
  ChatScreen(this.username);
  _messageBuilder(Message message, bool isMe) {
    Container msg = new Container(
        decoration: BoxDecoration(
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
              style: TextStyle(color: isMe ? Colors.white70 : Colors.black),
            ),
            Container(
              alignment: isMe ? Alignment.bottomRight : Alignment.bottomLeft,
              child: Text(
                message.sender,
                style: TextStyle(color: isMe ? Colors.white70 : Colors.black),
              ),
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
            onPressed: () {
              setState(() {
                if (msgText.text.isNotEmpty) {
                  _messages.add(new Message(text: msgText.text, sender: "me"));
                  messageCount++;
                  msgText.clear();
                }
              });
              print(_messages.length);
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
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 15.0),
                reverse: true,
                itemCount: this.messageCount,
                itemBuilder: (context, index) => _messageBuilder(
                    _messages[_messages.length - index - 1], true),
              ),
            )),
            _messageComposser()
          ],
        ),
      ),
    );
  }
}
