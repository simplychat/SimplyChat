import 'package:flutter/material.dart';
import 'package:simply/utils/constants.dart';
import 'package:simply/widgets/chat_box.dart';

class ChatRoom extends StatefulWidget {

  ChatRoom({Key key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final List<ChatBox> _messages = <ChatBox>[];
  final TextEditingController _chatController = new TextEditingController();
  var messageToSend = "";

  void _handleSubmit(String text) {
    _chatController.clear();
    ChatBox message = RightChatBox(textToShow: text);

    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Chat Room'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(materialMarginSmall),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
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
                          child:
                          TextField(
                            controller: _chatController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(
                                  materialMarginSmall),
                            ),
                            onChanged: (message) {
                              messageToSend = message;
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
                            _handleSubmit(messageToSend);
                            messageToSend = "";
                          })
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}