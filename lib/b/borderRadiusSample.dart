import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BorderRadiusSample extends BaseContentApp {
  static const String routeName = 'BorderRadiusSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  矩形每个角的一组不可变半径。

  一般在BoxDecoration 中使用，需要设置 shape 为BoxShape.rectangle。
  
  BorderRadius不适配语言方向，
  
  如果需要适配语言方向的，请使用BorderRadiusDirectional。
  
  ''';

  @override
  String get sampleCode => '''
  Container(
    width: 100.0,
    height: 100.0,
    decoration: const BoxDecoration(
      color: Colors.amber,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
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
              color: Colors.amber,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ],
      ),
    );
  }
}
