import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';


// ignore: must_be_immutable
class AnimatedPositionedSample extends BaseContentApp {

  static const String routeName = 'AnimatedPositionedSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  Positioned widget 的动画版本，需要是 Stack widget 的直接子 widget，
  可以控制 left top right bottom width height，
  
  在水平方向上不能同时设置 left right 和 width，因为只需要给定其中两个就可以计算得出第三个。
  
  在垂直方向上同理不能同时设置 top bottom 和 height。
  ''';

  @override
  String get sampleCode =>
  '''
  Stack(
    children: <Widget>[
      AnimatedPositioned(
        left: _left,
        top: _top,
        child: Image.asset('images/img.jpeg'),
        duration: const Duration(seconds: 1),
      )
    ],
  ),
  ''';
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {

  double _left = 0.0;
  double _top = 0.0;
  double _height = 80.0;
  double _width = 80.0;


  void _change() {
    setState(() {
      if (_left <= 0) {
        _left = 100.0;
        _top = 50.0;
        _height = 150.0;
        _width = 150.0;
      } else {
        _left = 0.0;
        _top = 0.0;
        _height = 80.0;
        _width = 80.0;

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 300.0,
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                left: _left,
                top: _top,
                width: _width,
                height: _height,
                child: Image.asset('images/img.jpeg'),
                duration: const Duration(seconds: 1),
              )
            ],
          ),
        ),
        SizedBox(height: 20.0),
        RaisedButton(
            child: Text('点击切换动画'),
            onPressed: (){
              _change();
            }),
      ],
    );
  }
}