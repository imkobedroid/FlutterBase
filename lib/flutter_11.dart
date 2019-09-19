//如何构建自定义 Widgets
//在Android中，您通常会继承View或已经存在的某个控件，然后覆盖其绘制方法来实现自定义View。
//在Flutter中，一个自定义widget通常是通过组合其它widget来实现的，而不是继承。
//我们来看看如何构建持有一个label的CustomButton。这是通过将Text与RaisedButton组合来实现的，而不是扩展RaisedButton并重写其绘制方法实现：

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({this.label});

  String label;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: () {},
        child: new Text(label, textDirection: TextDirection.ltr,));
  }
}


//因为RaisedButton是一个Material的组件  所以用Scaffold包裹 ，但是最外层必须返回一个MaterialApp
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(appBar: new AppBar(title: new Text("demo"),),
            body: new CustomButton(label: "hello")));
  }
}

void main() {
  runApp(new MyButton());
}



