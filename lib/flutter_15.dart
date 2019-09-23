//如何在Flutter中显示进度指示器

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
    return new MaterialApp(title: "demo", home: SampleAppPageState(),);
  }
}


class SampleAppPageState extends StatefulWidget {
  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}


class _SampleAppPageState extends State<SampleAppPageState> {

  List widgets = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: getBody());
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }


  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }
    return false;
  }


  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }


  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }

  Widget getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  ListView getListView() {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return getRow(index);
    }, itemCount: widgets.length);
  }


  Widget getRow(int index) {
    return new Padding(padding: new EdgeInsets.all(10),
        child: new Text("Row ${widgets[index]["title"]}"));
  }

}