//当你点击一个FloatingActionButton时，如何在两个widget之间切换

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "sample", home:
    new SampleAppPage(),);
  }

}

class SampleAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SampleAppPage();
  }
}

class _SampleAppPage extends State<SampleAppPage> {

  bool isSelect = false;

  void setStateFul() {
    setState(() {
      isSelect = !isSelect;
    });
  }

  _getToggleChild() {
    if (isSelect) {
      return new Text('Toggle One');
    } else {
      return new MaterialButton(
          onPressed: () {}, child: new Text("'Toggle Two'"));
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(title: new Text(
        "appbar", style: new TextStyle(color: Colors.yellow, fontSize: 16
    ))), body: new Center(child: _getToggleChild()),
      floatingActionButton: new FloatingActionButton(
          onPressed: setStateFul, tooltip: 'Update Text',
          child: new Icon(Icons.update)),
    );
  }

}