//怎么知道哪个列表项被点击
//在Android中，ListView有一个方法’onItemClickListener’来确定哪个列表项被点击。 Flutter中可以更轻松地通过您传入的处理回调来进行操作。
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}


class SampleAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SampleAppPageState();
  }

}

class _SampleAppPageState extends State {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(title: new Text("测试点击了哪项"),),
      body: new ListView(children: getWidgets(),),);
  }

  getWidgets() {
    List<Widget> widgets = [];
    for (int a = 0; a < 100; a++) {
      widgets.add(new GestureDetector(
        child: new Padding(
            padding: EdgeInsets.all(10), child: new Text("Row $a")),
        onTap: () {
          print('row tapped');
        }
        ,));
    }
    return widgets;
  }
}