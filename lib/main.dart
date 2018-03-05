// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Workout Pace Keeper',
      home: new AwesomeButton()
    ),
  );
}

class AwesomeButton extends StatefulWidget {
  @override
  AwesomeButtonState createState() => new AwesomeButtonState();
}

class AwesomeButtonState extends State<AwesomeButton> {

  void onPressed() {
    setState(() {
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
              new Text("Select your place below", style: new TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
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
                child: new Center (child: new Text("5 Seconds", style: new TextStyle(fontSize: 20.0)))
              ),
              new RaisedButton(
                child: new Text("START", style: new TextStyle(fontSize: 25.0, color: Colors.white)),
                color: Colors.lightBlue,
                onPressed: onPressed,
              )
            ]
          )
        )
      )
    );

  }
}