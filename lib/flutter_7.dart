//TapboxA 管理自身状态.（子组件自己管理状态）
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {

  TapboxA({
    Key key
  }) :super(key: key); //构造函数传参

  @override
  State<StatefulWidget> createState() {
    return new _TapboxAState();
  }
}

class _TapboxAState extends State<TapboxA> {

  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(onTap: _handleTap,
        child: new Container(
          child: new Center(child: new Text(_active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 16))),
          width: 200,
          height: 200,
          decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600],
          ),)
    ); //用户手势检测
  }

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: "title", home:
    new Scaffold(appBar: new AppBar(title: new Text("title"),),
      body: new Center(child: new TapboxA(),),),);
  }

}

//void main(){
//  runApp(new MyApp());
//}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ParentWidget 为 TapboxB 管理状态.(父组件帮子组件管理)
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return MaterialApp(home: new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    ),);
  }
}


class MyAppB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new ParentWidget(),);
  }
}


void main() {
  runApp(new MyAppB());
}

