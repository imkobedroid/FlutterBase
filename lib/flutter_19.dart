import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//如何在Text上定义样式


//void main() {
//  runApp(new Font());
//}
//
//class Font extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//        home: new Scaffold(body: new Center(child: new TextField(
//          decoration: new InputDecoration(hintText: "请输入你的名字"),),),));
//  }
//}


//正确性验证

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
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
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State {

  String _error;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(title: new Text(
      "测试", style: new TextStyle(fontSize: 16, color: Colors.red),),), body:
    new Center(child: new TextField(
      decoration: new InputDecoration(
          hintText: "请输入你的邮件", errorText: getErrorInfo()),
      onSubmitted: (String info) {
        setState(() {
          if (isEmail(info)) {
            _error = null;
          } else {
            _error = "Error: This is not an email";
          }
        });
      },),
    ),);
  }

  getErrorInfo() => _error;

  bool isEmail(String em) {
    String emailRegexp = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailRegexp);
    return regExp.hasMatch(em);
  }

}




