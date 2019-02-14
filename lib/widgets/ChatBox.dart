import 'package:flutter/material.dart';
import 'package:simply/utils/constants.dart';

class ChatBox extends StatefulWidget {
  final String textToShow;

  ChatBox({Key key, @required this.textToShow}) : super(key: key);

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}