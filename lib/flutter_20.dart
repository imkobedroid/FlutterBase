import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:sqflite/sqflite.dart';


//如何在Flutter中访问Shared Preferences ?


void main() {
  runApp(new MaterialApp(home: new Scaffold(
    body: new Center(
      child: new RaisedButton(
        onPressed: _incrementCounter, child: new Text('Increment Counter'),
      ),),
  ),));
}

_incrementCounter() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  int counter = (preferences.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  preferences.setInt('counter', counter);
}