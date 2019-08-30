import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new FlutterApp());


class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "图片操作",
      home: new MyApp(),
    );
  }
}


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyStateFul();
  }

}


class MyStateFul extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(title: new Text(
        "图片分配", style: TextStyle(fontSize: 16, color: Colors.yellow)),
        backgroundColor: Colors.red[500]), body: new Row(children: <Widget>[
      new Expanded(
        child: new Padding(
          padding: EdgeInsets.all(10), child: Image.asset('images/lake.jpg'),),
        flex: 1,),
      new Expanded(
        child: new Padding(
          padding: EdgeInsets.all(10), child: Image.asset('images/lake.jpg'),),
        flex: 2,),
      new Expanded(
        child: new Padding(
          padding: EdgeInsets.all(10), child: Image.asset('images/lake.jpg'),),
        flex: 1,)
    ],),);
  }

}