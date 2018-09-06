import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BorderDirectionalSample extends BaseContentApp {

  static const String routeName = 'BorderDirectionalSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  BorderDirectional和Border类似，不过它支持语言书写方向，
  用 start 代替 left，用 end 代替 right，
  在从左到右书写的语言中，start 就是左侧,
  在从右到左书写的语言中，start 就是右侧，
  
  盒子的边框，由四个边组成：顶部，右侧，底部，左侧。

  边由BorderSide对象表示。
  ''';

  @override
  String get sampleCode =>
  '''
  Container(
    width: 100.0,
    height: 100.0,
    decoration: const BoxDecoration(
      border: const BorderDirectional(
        top: const BorderSide(width: 1.0, color: Colors.blueAccent),
        start: const BorderSide(width: 1.0, color: Colors.amber),
        end: const BorderSide(width: 1.0, color: Colors.redAccent),
        bottom: const BorderSide(width: 1.0, color: Colors.deepPurpleAccent),
      ),
    ),
  );
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
              border: const BorderDirectional(
                top: const BorderSide(width: 1.0, color: Colors.blueAccent),
                start: const BorderSide(width: 1.0, color: Colors.amber),
                end: const BorderSide(width: 1.0, color: Colors.redAccent),
                bottom: const BorderSide(width: 1.0, color: Colors.deepPurpleAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
