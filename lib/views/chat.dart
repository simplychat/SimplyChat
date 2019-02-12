import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {

  final String nickName;

  ChatRoom({Key key, @required this.nickName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Chat Room'),
      ),
      body: Center(
          child: Text(nickName)
      ),
    );
  }
}