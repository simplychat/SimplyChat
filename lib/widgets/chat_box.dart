import 'package:flutter/material.dart';
import 'package:simply/utils/constants.dart';
import 'package:simply/widgets/avatar.dart';

class RightChatBox extends ChatBox {
  final String textToShow;
  final String url;

  RightChatBox({Key key, @required this.textToShow, @required this.url}) :
        super(key: key, textToShow: textToShow, url: url, leftBox: false);
}

class LeftChatBox extends ChatBox {
  final String textToShow;
  final String url;

  LeftChatBox({Key key, @required this.textToShow, @required this.url}) :
        super(key: key, textToShow: textToShow, url: url, leftBox: true);
}

abstract class ChatBox extends StatefulWidget {
  final String textToShow;
  final bool leftBox;
  final String url;

  ChatBox({Key key, @required this.textToShow, @required this.leftBox, @required this.url})
      : super(key: key);

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.leftBox
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: <Widget>[
        widget.leftBox ? Avatar(url: widget.url) : Container(),
        Container(
            padding: EdgeInsets.all(materialMarginSmall),
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
        ),
        widget.leftBox ? Container() : Avatar(url: widget.url)
      ],
    );
  }
}