import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClipOvalSample extends BaseContentApp {

  static const String routeName = 'ClipOvalSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  一个 widget，用来裁剪子widget，让其成员一个椭圆、圆形的 widget，超出这个范围会被裁剪掉不显示。
  ''';

  @override
  String get sampleCode =>
      '''
  ClipOval(
    clipper: _ImageClipper(),
    child: Image.asset('images/img.jpeg'),
  ),
  ''';
}

class _Sample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('默认是裁剪成圆形，如下所示'),
          SizedBox(height: 10.0),
          ClipOval(
            child: Image.asset('images/img.jpeg'),
          ),
          SizedBox(height: 30.0,),
          Text('可以传入一个矩形区域，这样在裁剪的时候就可以变成一个椭圆，如下所示'),
          SizedBox(height: 10.0,),
          ClipOval(
            clipper: _ImageClipper(),
            child: Image.asset('images/img.jpeg'),
          ),
        ],
      ),
    );
  }
}

class _ImageClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0.0, size.height / 4, size.width, size.height / 4 * 3);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}