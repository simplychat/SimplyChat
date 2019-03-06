import 'package:flutter/material.dart';
import 'package:simply/utils/constants.dart';

class Avatar extends StatefulWidget {
  final String url;

  Avatar({Key key, @required this.url})
      : super(key: key);

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: chatAvatarSize,
        height: chatAvatarSize,
        child: Container(
          child: Image.network(
            widget.url,
            fit: BoxFit.cover,
          )
        )
      )
    );
  }
}