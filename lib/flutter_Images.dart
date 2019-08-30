import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//
//const TextStyle({
//this.inherit: true,         // 为false的时候不显示
//this.color,                    // 颜色
//this.fontSize,               // 字号
//this.fontWeight,           // 字重，加粗也用这个字段  FontWeight.w700
//this.fontStyle,                // FontStyle.normal  FontStyle.italic斜体
//this.letterSpacing,        // 字符间距  就是单个字母或者汉字之间的间隔，可以是负数
//this.wordSpacing,        // 字间距 句字之间的间距
//this.textBaseline,        // 基线，两个值，字面意思是一个用来排字母的，一人用来排表意字的（类似中文）
//this.height,                // 当用来Text控件上时，行高（会乘以fontSize,所以不以设置过大）
//this.decoration,        // 添加上划线，下划线，删除线
//this.decorationColor,    // 划线的颜色
//this.decorationStyle,    // 这个style可能控制画实线，虚线，两条线，点, 波浪线等
//this.debugLabel,
//String fontFamily,    // 字体
//String package,
//})


//void main() => runApp(new FlutterApp());
//void main() => runApp(new _MyHomePageState());
//void main() => runApp(new _MyHomePageStateOne());
void main() => runApp(new _MyHomePageStateTwo());

/// 对图片进行比例的显示 有点像Android中的xml布局的widget
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


///////////////////////////////////////////////////////////////////////


class Page extends State<PageInfo> {
  @override
  Widget build(BuildContext context) {
    var ratings = new Container(
        padding: EdgeInsets.all(10),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              new Icon(Icons.star, color: Colors.red),
              new Icon(Icons.star, color: Colors.red),
              new Icon(Icons.star, color: Colors.red),
              new Icon(Icons.star, color: Colors.red),
              new Icon(Icons.star, color: Colors.red)
            ]),
            new Text("170 Reviews",
                style: new TextStyle(
                  fontSize: 16,
                  color: Colors.yellow,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,))
          ],

        ));

    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );
    // DefaultTextStyle.merge可以允许您创建一个默认的文本样式，该样式会被其所有的子节点继承
    var iconList = DefaultTextStyle.merge(
        style: descTextStyle, child: new Container(
      padding: EdgeInsets.all(20),
      child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Column(children: <Widget>[
            new Icon(Icons.kitchen, color: Colors.green[500]),
            new Text('PREP:'),
            new Text('25 min'),
          ],),
          new Column(children: <Widget>[
            new Icon(Icons.kitchen, color: Colors.green[500]),
            new Text('COOK:'),
            new Text('1 hr'),
          ],),
          new Column(children: <Widget>[
            new Icon(Icons.kitchen, color: Colors.green[500]),
            new Text('FEEDS:'),
            new Text('4-6'),
          ],)
        ],
      ),
    ));
    return new Scaffold(appBar: new AppBar(title: new Text(
      "测试组件", style: new TextStyle(fontSize: 16, color: Colors.black),),
        backgroundColor: Colors.greenAccent), body: new Column(
      children: <Widget>[
        ratings,
        iconList
      ],
    ));
  }
}


class PageInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}

class _MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: PageInfo(),);
  }

}

///////////////////////////////////////////////////////////////////////

//网格布局
class PageOne extends State<PageInfoOne> {
  @override
  Widget build(BuildContext context) {
    /**
     *构建图片的方法
     */
    List<Container> _buildGridTileList(int size) {
      return new List.generate(size, (i) =>
      new Container(
          child: new Image.asset('images/lake.jpg')));
    }


    Widget _buildGrid() {
      return new GridView.extent(
        maxCrossAxisExtent: 150,
        padding: EdgeInsets.all(10),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(30),
      );
    }

    return new Scaffold(
        appBar: new AppBar(backgroundColor: Colors.green, title: new Text(
            "网格布局测试", style: new TextStyle(fontSize: 20, color: Colors.red))
        ), body: new Center(child: _buildGrid()));
  }
}


class PageInfoOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PageOne();
  }
}

class _MyHomePageStateOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: PageInfoOne(),);
  }

}


///////////////////////////////////////////////////////////////////////
//ListView的测试
class PageTwo extends State<PageInfoTwo> {
  @override
  Widget build(BuildContext context) {
    List<Container> listInfo(int size) {
      return new List.generate(size, (i) =>
      new Container(child: new ListTile(
          title: new Text('The Castro Theater',
              style: new TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 20.0)),
          subtitle: new Text('429 Castro St'),
          leading: new Icon(
              Icons.theaters,
              color: Colors.blue[500]
          )
      )));
    }


    List<Widget> list = listInfo(30);
    return new Scaffold(
        appBar: new AppBar(backgroundColor: Colors.green, title: new Text(
            "ListView测试", style: new TextStyle(fontSize: 20, color: Colors.red))
        ), body: new Center(child: new ListView(children: list)));
  }
}


class PageInfoTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PageTwo();
  }
}

class _MyHomePageStateTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: PageInfoTwo(),);
  }

}
