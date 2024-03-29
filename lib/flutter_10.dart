//如何使用Canvas draw/paint
//Flutter有两个类可以帮助您绘制画布，CustomPaint和CustomPainter，它们实现您的算法以绘制到画布。

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignaturePainter extends CustomPainter {
  SignaturePainter({this.points});

  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int a = 0; a < points.length - 1; a++) {
      if (points[a] != null && points[a + 1] != null) {
        canvas.drawLine(points[a], points[a + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) {
    return oldDelegate.points != points;
  }
}

class Signature extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SignatureState();
  }

}

class SignatureState extends State<Signature> {

  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(onPanUpdate: (DragUpdateDetails details) {
      setState(() {
        RenderBox referenceBox = context.findRenderObject();
        Offset localPosition =
        referenceBox.globalToLocal(details.globalPosition);
        _points = new List.from(_points)
          ..add(localPosition);
      });
    }, onPanEnd: (DragEndDetails details) {
      _points.add(null);
    },
      child: new CustomPaint(painter: new SignaturePainter(points: _points),),);
  }
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new Signature(),);
  }
}

void main() {
  runApp(new MaterialApp(home: new DemoApp()));
}

