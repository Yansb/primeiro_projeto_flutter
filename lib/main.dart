import 'package:flutter/material.dart';

void main() => runApp(BullsEyeApp());

class BullsEyeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BullsEye',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GamePage(title: 'BullsEye'),
    );
  }
}

class GamePage extends StatefulWidget {
  GamePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _alertIsVisible = false;
  bool _knockKnockIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hot reload is awesome',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            TextButton(
              child: Text(
                "Hit Me!",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                this._alertIsVisible = true;
                _showAlert(context);
              },
            ),
            TextButton(
              child: Text(
                "Knock Knock!",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                this._alertIsVisible = true;
                _showJoke(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          this._alertIsVisible = false;
          print("awesome $_alertIsVisible");
        },
        child: Text("Awesome!"));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hello There'),
            content: Text("This is my first pop-up"),
            actions: <Widget>[
              okButton,
            ],
            elevation: 5,
          );
        });
  }

  void _showJoke(BuildContext context) {
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          this._knockKnockIsVisible = false;
          print("awesome $_knockKnockIsVisible");
        },
        child: Text("Awesome!"));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Who's there?"),
            content: Text("Me hehehe"),
            actions: <Widget>[
              okButton,
            ],
            elevation: 5,
          );
        });
  }
}
