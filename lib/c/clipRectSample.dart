import 'dart:ui' show PathOperation;
import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClipRectSample extends BaseContentApp {

  static const String routeName = 'ClipRectSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
      '''
  一个 widget， 沿着子 widget边框来裁剪，或者结合子 widget 的大小计算出需要裁剪的 Rect 区域。
  
  超出区域的内容不会显示。
  ''';

  @override
  String get sampleCode =>
      '''
  ClipRect(
    clipper: _ImageClipper(),
    child: Image.asset('images/img.jpeg'),
  ),
  
  class _ImageClipper extends CustomClipper<Rect> {
    @override
    Rect getClip(Size size) {
      return Rect.fromLTRB(0.0, size.height / 4, size.width, size.height / 4 * 3);
    }

    @override
    bool shouldReclip(CustomClipper<Rect> oldClipper) {
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
          Text('默认是裁剪子控件的大小，会将一些阴影之类的效果裁剪掉，如下右侧的图片是有阴影的，左侧由于使用了 ClipRect，所以阴影被裁剪掉了'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ClipRect(
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Image.asset('images/img.jpeg'),
                ),
              ),
              PhysicalModel(
                color: Colors.white,
                elevation: 8.0,
                child: Image.asset('images/img.jpeg'),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Text('也可以由子 widget 的大小计算出合适的裁剪区域'),
          ClipRect(
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
    return Rect.fromLTRB(0.0, size.height / 4, size.width, size.height / 4 * 3);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}