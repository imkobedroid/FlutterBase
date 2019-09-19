import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//Intent在Flutter中等价于什么？
//在Android中，Intents主要有两种使用场景：在Activity之间切换，以及调用外部组件。 Flutter不具有Intents的概念，但如果需要的话，Flutter可以通过Native整合来触发Intents。
//要在Flutter中切换屏幕，您可以访问路由以绘制新的Widget。 管理多个屏幕有两个核心概念和类：Route 和 Navigator。Route是应用程序的“屏幕”或“页面”的抽象（可以认为是Activity）， Navigator是管理Route的Widget。Navigator可以通过push和pop route以实现页面切换。
//和Android相似，您可以在AndroidManifest.xml中声明您的Activities，在Flutter中，您可以将具有指定Route的Map传递到顶层MaterialApp实例


void main() {
  runApp(new MaterialApp(
    home: new MyAppHome(),
    routes: <String, WidgetBuilder>{
      '/a': (BuildContext context) => new MyPage(title: 'page A'),
      '/b': (BuildContext context) => new MyPage(title: 'page B'),
      '/c': (BuildContext context) => new MyPage(title: 'page C'),
    },
  ));
}

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(title: new Text("hello"),),
      floatingActionButton: new FloatingActionButton(onPressed: () {
        Navigator.of(context).pushNamed('/b');
      }, child: new Icon(Icons.menu),),);
  }
}


// ignore: must_be_immutable
class MyPage extends StatelessWidget {
  MyPage({this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("hello"),), body: new Text(title));
  }
}

