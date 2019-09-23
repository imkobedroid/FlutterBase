//runOnUiThread 在Flutter中等价于什么


//Dart是单线程执行模型，支持Isolates（在另一个线程上运行Dart代码的方式）、事件循环和异步编程。 除非您启动一个Isolate，否则您的Dart代码将在主UI线程中运行，并由事件循环驱动（译者语：和JavaScript一样）。
//例如，您可以在UI线程上运行网络请求代码而不会导致UI挂起(译者语：因为网络请求是异步的)：

import "dart:convert";

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Sample App', theme: new ThemeData(
        primarySwatch: Colors.blue
    ),
      home: new SampleAppPage(),
    );
  }
}


class _SampleAppPageState extends State {

  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(title: new Text(
        "demo", style: new TextStyle(fontSize: 16, color: Colors.red)),), body:
    new ListView.builder(itemBuilder: (BuildContext context, int index) {
      return getRow(index);
    }, itemCount: widgets.length));
  }

  Widget getRow(int position) {
    return new Padding(padding: EdgeInsets.all(10),
        child: new Text("Row ${widgets[position]["title"]}"));
  }


  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}

class SampleAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SampleAppPageState();
  }
}




