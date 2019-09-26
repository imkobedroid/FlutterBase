import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//如何动态更新ListView
//在Flutter中，如果setState（）中更新widget列表，您会发现没有变化， 这是因为当setState被调用时，Flutter渲染引擎会遍历所有的widget以查看它们是否已经改变。 当遍历到你的ListView时，它会做一个==运算，以查看两个ListView是否相同，因为没有任何改变，因此没有更新数据。
//要更新您的ListView，然后在setState中创建一个新的List（）并将所有旧数据复制到新列表中。这是实现更新的简单方法（译者语：此时状态改变，ListView被重新构建）

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

  List<Widget> widgets = [];


  Widget getRow(int i) {
    return new GestureDetector(
      child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Text("Row $i")),
      onTap: () {
        setState(() {
          widgets = new List.from(widgets);
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(title: new Text("测试动态更新list"),),
      body: new ListView(children: widgets,),);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

}


//推荐的方法是使用ListView.Builder。当您拥有动态列表或包含大量数据的列表时，此方法非常有用。 这实际上相当于在Android上使用RecyclerView，它会自动为您回收列表元素：