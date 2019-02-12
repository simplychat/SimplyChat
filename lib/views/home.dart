import 'package:flutter/material.dart';
import 'package:simply/views/chat.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String nickName = "";

  void _updateNickName(String name) {
    setState(() {
      nickName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SimplyChat'),
        ),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20.0),
                      labelText: 'Nickname',
                    ),
                    onChanged: (name) {
                      _updateNickName(name);
                    },
                    autofocus: false,
                  ),
                )
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              color: Colors.green[500],
              child: const Text(
                'Go',
                semanticsLabel: 'Enter chat',
                style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ChatRoom(nickName: nickName,)),);
              },),
          ],
        )
    );
  }
}