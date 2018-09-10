import 'dart:ui' show PathOperation;
import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClipRRectSample extends BaseContentApp {

  static const String routeName = 'ClipRRectSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
      '''
  一个 widget， 将子 widget的形状裁剪成圆角矩形。
  
  如果想要设置四个角的圆角一样，那么直接设置 borderRadius 属性。
  
  如果想只想对其中几个角进行圆角处理，或者圆角的半径不一样的时候，需要自定义裁剪路径。
  
  超出区域的内容不会显示。
  ''';

  @override
  String get sampleCode =>
      '''
  ClipRRect(
    clipper: _ImageClipper(),
    child: Image.asset('images/img.jpeg'),
  ),
  
  class _ImageClipper extends CustomClipper<RRect> {
    @override
    RRect getClip(Size size) {
      return RRect.fromLTRBAndCorners(0.0, size.height / 4, size.width, size.height / 4 * 3,
        topLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(15.0),
      );
    }

    @override
    bool shouldReclip(CustomClipper<RRect> oldClipper) {
      return true;
    }
  }
  ''';
}

class _Sample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('默认是裁剪子控件的大小'),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset('images/img.jpeg'),
          ),
          SizedBox(height: 30.0),
          Text('自定义圆角矩形的大小和 圆角的个数、圆角的大小'),
          ClipRRect(
            clipper: _ImageClipper(),
            child: Image.asset('images/img.jpeg'),
          ),
        ],
      ),
    );
  }
}

class _ImageClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    return RRect.fromLTRBAndCorners(0.0, size.height / 4, size.width, size.height / 4 * 3,
      topLeft: Radius.circular(15.0),
      bottomRight: Radius.circular(15.0),
    );
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) {
    return true;
  }
}