import 'package:flutter/material.dart';
import 'package:simply/utils/constants.dart';
import 'package:simply/views/chat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var txt = TextEditingController();

  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('id') ?? 0);
    });
    _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('nickname') ?? '');
    });
    _initializeNameTextField();
    _setIdIfEmpty();
  }

  Future _initializeNameTextField() async {
    txt.text = await _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('nickname') ?? '');
    });
  }

  Future<void> _setNameIfEmpty(String newName) async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      prefs.setString('nickname', newName).then((bool success) {
        return newName;
      });
    });
  }

  Future<void> _setIdIfEmpty() async {
    final SharedPreferences prefs = await _prefs;
    final generatedId = DateTime.now().millisecondsSinceEpoch;

    setState(() {
      if (prefs.getInt('id') == null) {
        // Todo: store generatedId in FireBase
        // It's ok for this number to be long since users do not need to know
        // this: as of now, all chat making are random
        prefs.setInt('id', generatedId).then((bool success) {
          return generatedId;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(APP_NAME),
        ),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(30.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SMALL_RADIUS),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20.0),
                      labelText: 'Nickname',
                    ),
                    controller: txt,
                    onChanged: (name) {
                      _setNameIfEmpty(name);
                    },
                    autofocus: false,
                  ),
                )
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(SMALL_RADIUS)),
              ),
              color: Colors.green[500],
              child: Text(
                GO_BUTTON_TEXT,
                semanticsLabel: 'Enter chat',
                style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ChatRoom()));
              },),
          ],
        )
    );
  }
}