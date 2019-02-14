import 'package:flutter/material.dart';
import 'package:simply/utils/constants.dart';
import 'package:simply/widgets/ChatBox.dart';

class ChatRoom extends StatefulWidget {
  final String nickName;

  ChatRoom({Key key, @required this.nickName}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Chat Room'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Container(
            padding: EdgeInsets.all(materialMarginSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(smallRadius),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(materialMarginSmall),
                          ),
                          onChanged: (name) {
                            // Todo
                          },
                          autofocus: false,
                        ),
                      )
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: materialMarginSmall),
                    child: IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          // Todo
                        })
                )
              ],
            )
        ),
      ),
      body: Center(
          child: ChatBox(
              textToShow: 'Lorem ipsum dolor sit amet, consectetur adipiscing '
                  'elit, sed do eiusmod tempor incididunt ut labore et dolore magna'
                  ' aliqua.')
      ),
    );
  }
}