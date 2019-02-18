import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoxDecorationSample extends BaseContentApp {
  static const String routeName = 'BoxDecorationSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  BoxDecoration主要是给DecoratedBox、Container做装饰用的，
  可以设置形状(圆角矩形、原形)、边框，
  背景可以设置纯色背景、渐变背景、图片背景、还可以设置阴影
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
      image: DecorationImage(
        image: ExactAssetImage('images/img.jpeg'),
      ),
      gradient: RadialGradient(colors: <Color>[Colors.amber, Colors.white]),
      boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.redAccent,
                  offset: Offset(0.0, 5.0),
                  blurRadius: 5.0,
                  spreadRadius: 10.0
                ),
      ],
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
            alignment: Alignment.center,
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            child: Text('圆角矩形'),
          ),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
            child: Text('圆形'),
          ),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.deepPurpleAccent, width: 3.0),
            ),
            child: Text('边框'),
          ),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [Colors.amber, Colors.white]),
            ),
            child: Text('背景渐变'),
          ),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: ExactAssetImage('images/img.jpeg'),
              ),
            ),
            child: Text(
              '背景是图片',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.redAccent,
                    offset: Offset(0.0, 5.0),
                    blurRadius: 5.0,
                    spreadRadius: 10.0),
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 5.0),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Text('底部多个阴影'),
          ),
        ],
      ),
    );
  }
}
