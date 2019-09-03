import 'package:flutter/material.dart';


void main() {
  runApp(new MaterialApp(title: "状态变化操作", home: new Counter(),));
}
//void main() {
//  runApp(new MaterialApp(title: "手势操作",home: new MyButton(),));
//}


//void main() {
//  runApp(new MaterialApp(title: "导航栏", home: new TutorialHome(),));
//}

////////////////////////////////////////////
//使用 Material 组件

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(
      leading: new IconButton(
        icon: new Icon(Icons.menu),
        onPressed: null,
        tooltip: "Navigation menu",),
      title: new Text('Example title'),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.search), onPressed: null, tooltip: "Search",),
      ],
    ),
      body: new Center(child: new Text("Hello, world!"),),
      floatingActionButton: new FloatingActionButton(
        onPressed: null, tooltip: "Add", child: new Icon(Icons.add),),);
  }
}


////////////////////////////////////////////
//手势监听
//decoration 表示修饰的背景颜色…修
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print("hello world!");
      },

      child: new Container(
        height: 36,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(10),
            color: Colors.lightGreen[500]
        ),
        child: new Center(child: new Text(
          "Engage", style: new TextStyle(fontSize: 16, color: Colors.red[500
        ]),),),

      ),
    );
  }
}


////////////////////////////////////////////
//根据用户输入改变widget
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //每次调用setState方法会重新运行build方法
    return new Row(
      children: <Widget>[
        new RaisedButton(onPressed: _increment,
          child: new Text("Increment"),
        ),
        new Text('Count: $_counter')
      ],
    );
  }

}
