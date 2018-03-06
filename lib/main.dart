// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:vibrate/vibrate.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Workout Pace Keeper',
      home: new AwesomeButton()
    ),
  );
}

var paceNum = 5;
var timerNum = 100;
bool isStart = true;

class AwesomeButton extends StatefulWidget {
  @override
  AwesomeButtonState createState() => new AwesomeButtonState();
}

class AwesomeButtonState extends State<AwesomeButton> {

  

  int prettyNum = paceNum ~/ 1000;
  Timer timer;
  String button = "START";
  var buttonColor = Colors.lightBlue;

  void startInterval() {
    const interval = const Duration(milliseconds: 1000);
    var duration = interval*paceNum;
    timer = new Timer.periodic(duration, (Timer t) => intervalCallback(duration));

  }

  void intervalCallback(var interval) {
    if (isStart){
      timer.cancel();
    }
    else {
      Vibrate.vibrate();
      
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
              new Text("Select your pace below", style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
              new Container(
                margin: new EdgeInsets.all(40.0),
                height: 200.0,
                width: 200.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: Colors.lightBlue,
                    width: 2.0
                  )
                ),
                child: new Center (child: new Text(":" + paceNum.toString(), style: new TextStyle(fontSize: 65.0)))
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
