//Stateful（有状态） 和 stateless（无状态） widgets


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: "测试", home: new FavoriteWidget());
  }
}


class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() {
    return new _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  bool _isFavorited = true;
  int _favoriteCount = 41;


  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
      } else {
        _favoriteCount += 1;
      }
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    //注意 这里返回的组件必须用Scaffold包裹一下，不能直接返回row 不然会报找不到组件错误
    // 因为row不是继承于StatelessWidget组件！这里必须要返回一个StatelessWidget组件
    //原因在于最外层的MyApp是继承于StatelessWidget组件的 所以从最内层必须返回一个这个组件进行构建
    return new Scaffold(appBar: new AppBar(title: new Text("测试"),), body:
    new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: EdgeInsets.all(10),
          child: new IconButton(
            icon: _isFavorited ? new Icon(Icons.star) : new Icon(
                Icons.star_border),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        new SizedBox(
          width: 100.0,
          child: new Container(
            child: new Text("$_favoriteCount人喜欢",
              style: new TextStyle(fontSize: 16, color: Colors.yellow[500]),),
          ),
        )
      ],
    ),);
  }

}