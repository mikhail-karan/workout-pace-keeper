// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:vibrate/vibrate.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Workout Pace Keeper',
      home: new AwesomeButton()
    ),
  );
}

var paceNum = 5;
var timerNum = 20;
bool isStart = true;

final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 1000),
    const Duration(milliseconds: 500),
];

class AwesomeButton extends StatefulWidget {
  @override
  AwesomeButtonState createState() => new AwesomeButtonState();
}

class AwesomeButtonState extends State<AwesomeButton> {

  Timer timer;
  String button = "START";
  var buttonColor = Colors.lightBlue;
  int intervalCount = 1;

  

  void startInterval() {
    const interval = const Duration(milliseconds: 1000);
    var duration = interval*paceNum;
    timer = new Timer.periodic(duration, (Timer t) => intervalCallback(duration));

  }

  void intervalCallback(var interval) {
    if (isStart){
      timer.cancel();
    }
    else if (intervalCount < timerNum){
      Vibrate.vibrate();
      intervalCount++;
    }
    else {
      Vibrate.vibrateWithPauses(pauses);
      intervalCount = 1;
      timer.cancel();
      setState(() {
        button = "START";
        buttonColor = Colors.lightBlue;
        isStart = true;
      });
      
    }
  }

  void onPressed() {
    setState(() {
      if (isStart){
        button = "STOP";
        buttonColor = Colors.red;
        isStart = false;
        startInterval();
      }
      else {
        button = "START";
        buttonColor = Colors.lightBlue;
        isStart = true;
        
        
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Workout Pace Keeper')),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.all(40.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[new Text("Set your interval and pace below", style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic))]
              ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text("Intervals:", style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  new Text("Seconds:", style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))
                ],
              ),
              new Container(
                margin: new EdgeInsets.only(bottom: 40.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[new NumberPicker.integer(
                    initialValue: timerNum,
                    minValue: 0,
                    maxValue: 60,
                    onChanged: (newValue) =>
                    setState(() => timerNum = newValue)),
                    new NumberPicker.integer(
                    initialValue: paceNum,
                    minValue: 0,
                    maxValue: 60,
                    onChanged: (newValue) =>
                    setState(() => paceNum = newValue)),
                  // new Text("Current number: $_currentValue")
                  ],
                ),
              ),
              new RaisedButton(
                padding: new EdgeInsets.all(20.0),
                child: new Text(button, style: new TextStyle(fontSize: 25.0, color: Colors.white)),
                color: buttonColor,
                onPressed: onPressed,
              )
            ]
          )
        )
      )
    );

  }
}
