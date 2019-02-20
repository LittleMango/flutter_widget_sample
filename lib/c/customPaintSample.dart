import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class CustomPaintSample extends BaseContentApp {
  static const String routeName = 'CustomPaintSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  CustomPaint有两个画板，一个是painter，画背景，一个是foregroundPainter，画前景，会传递一个Canvas和size，和java一样的绘制
  
  ''';

  @override
  String get sampleCode => '''
class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: CustomPaint(
        painter: _Sky(),
      ),
    );
  }
}

class _Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var gradient = RadialGradient(
      center: const Alignment(0.7, -0.6), //中心偏移
      radius: 0.2, //百分比
      colors: [const Color(0xFFFFFF00), const Color(0xFF0099FF)], //多少个颜色渐变
      stops: [0.4, 1.0], // 升序，之前是黄色，0.4-1.0是黄色渐变到蓝色，个数应该和colors一样
    );
    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );
  }

  //这个类没有字段，表示内容不会改变，所以只需要绘制一次
  @override
  bool shouldRepaint(_Sky oldDelegate) => false;
}Z
      ''';

  @override
  String get title => routeName;
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: CustomPaint(
        painter: _Sky(),
      ),
    );
  }
}

class _Sky extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var gradient = RadialGradient(
      center: const Alignment(0.7, -0.6), //中心偏移
      radius: 0.2, //百分比
      colors: [const Color(0xFFFFFF00), const Color(0xFF0099FF)], //多少个颜色渐变
      stops: [0.4, 1.0], // 升序，之前是黄色，0.4-1.0是黄色渐变到蓝色，个数应该和colors一样
    );
    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );
  }

  //这个类没有字段，表示内容不会改变，所以只需要绘制一次
  @override
  bool shouldRepaint(_Sky oldDelegate) => false;
}
