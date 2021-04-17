import 'dart:math';

import 'package:BullsEye/score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:BullsEye/prompt.dart';
import 'control.dart';
import 'gamemodel.dart';

void main() => runApp(BullsEyeApp());

class BullsEyeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
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
  GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(Random().nextInt(100) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Prompt(targetValue: _model.target),
            Control(model: _model),
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
            Score(
              round: _model.round,
              totalScore: _model.totalScore,
            )
          ],
        ),
      ),
    );
  }

  int _sliderValue() => _model.current;

  int _pointsForCurrentRound() {
    int maximumScore = 100;
    int difference = (_sliderValue() - _model.target).abs();

    return maximumScore - difference;
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
            content: Text("The slider value is: ${_sliderValue()}.\n" +
                "You scored ${_pointsForCurrentRound()} points this round"),
            actions: <Widget>[
              okButton,
            ],
            elevation: 5,
          );
        });
  }
}
