import 'package:flutter/material.dart';
import 'package:simply/utils/constants.dart';

class RightChatBox extends ChatBox {
  final String textToShow;

  RightChatBox({Key key, @required this.textToShow}) :
        super(key: key, textToShow:textToShow, leftBox: false);
}

class LeftChatBox extends ChatBox {
  final String textToShow;

  LeftChatBox({Key key, @required this.textToShow}) :
        super(key: key, textToShow:textToShow, leftBox: true);
}

abstract class ChatBox extends StatefulWidget {
  final String textToShow;
  final bool leftBox;

  ChatBox({Key key, @required this.textToShow, @required this.leftBox}) : super(key: key);

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: materialMarginSmall + (widget.leftBox? 0 : chatAvatarSize),
        right: materialMarginSmall + (widget.leftBox? chatAvatarSize : 0),
        top: materialMarginSmall,
        bottom: materialMarginSmall
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(miniRadius),
        ),
        child: Container(
          padding: EdgeInsets.all(materialMarginSmall),
          child: Text(widget.textToShow),
        )
      )
    );
  }
}