import 'package:flutter/material.dart';
import 'dart:async';

class Today extends StatefulWidget {
  createState() {
    return TodayState();
  }
}

class TodayState extends State<Today> {
  var _counterActive = false;
  var _start = 2000;
  Timer _timer;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: selectView(),
    );
  }

  Widget selectView() {
    if (!_counterActive) {
      return procrastinateButton();
    } else {
      return counterView();
    }
  }

  Widget procrastinateButton() {
    return Container(
        color: Colors.blue[200],
        child: FlatButton(
          onPressed: () {
            setState(() {
              _counterActive = true;
              startTimer();
            });
          },
          child: Text(
            'Procrastinar',
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.grey[800],
              backgroundColor: Colors.blue[200],
            ),
          ),
        ));
  }

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  Widget counterView() {
    var counter = format(Duration(seconds: _start));

    return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('counter is $counter'),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _counterActive = false;
                  _timer.cancel();
                });
              },
              child: Text(
                'Stop',
                style: new TextStyle(
                  fontSize: 20.0,
                ),
              ),
            )
          ],
        ));
  }
}
