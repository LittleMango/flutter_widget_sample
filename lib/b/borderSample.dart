import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BorderSample extends BaseContentApp {
  static const String routeName = 'BorderSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  盒子的边框，由四个边组成：顶部，右侧，底部，左侧。

  边由BorderSide对象表示。
  ''';

  @override
  String get sampleCode => '''
  Container(
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
      border:Border.all(width: 2.0, color:Colors.redAccent),
    ),
  ),
  ''';
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
              border: const Border(
                top: const BorderSide(width: 1.0, color: Colors.blueAccent),
                left: const BorderSide(width: 1.0, color: Colors.amber),
                right: const BorderSide(width: 1.0, color: Colors.redAccent),
                bottom: const BorderSide(
                    width: 1.0, color: Colors.deepPurpleAccent),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }
}
