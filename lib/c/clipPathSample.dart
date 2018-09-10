import 'dart:ui' show PathOperation;
import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClipPathSample extends BaseContentApp {

  static const String routeName = 'ClipPathSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  一个 widget，使用指定的Path路径来裁剪子 widget。
  超出区域的内容不会显示。
  ''';

  @override
  String get sampleCode =>
      '''
  ClipPath(
    clipper: _ImageClipper(),
    child: Image.asset('images/img.jpeg'),
  ),
  
  class _ImageClipper extends CustomClipper<Path> {
    @override
    Path getClip(Size size) {
      Path path1 = Path();
      path1.moveTo(0.0, 0.0);
      path1.quadraticBezierTo(size.width, 0.0, size.width, size.height);
      path1.quadraticBezierTo(0.0, size.height, 0.0, 0.0);
      
      Path path2 = Path();
      path2.moveTo(size.width, 0.0);
      path2.quadraticBezierTo(0.0, 0.0, 0.0, size.height);
      path2.quadraticBezierTo(size.width, size.height, size.width, 0.0);
      return Path.combine(PathOperation.union, path1, path2);
    }

    @override
    bool shouldReclip(CustomClipper<Path> oldClipper) {
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
          ClipPath(
            clipper: _ImageClipper(),
            child: Image.asset('images/img.jpeg'),
          ),
        ],
      ),
    );
  }
}

class _ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path1 = Path();
    path1.moveTo(0.0, 0.0);
    path1.quadraticBezierTo(size.width, 0.0, size.width, size.height);
    path1.quadraticBezierTo(0.0, size.height, 0.0, 0.0);
    Path path2 = Path();
    path2.moveTo(size.width, 0.0);
    path2.quadraticBezierTo(0.0, 0.0, 0.0, size.height);
    path2.quadraticBezierTo(size.width, size.height, size.width, 0.0);
    return Path.combine(PathOperation.union, path1, path2);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}