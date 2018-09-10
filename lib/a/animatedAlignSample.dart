
import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AnimatedAlignSample extends BaseContentApp {

  static const String routeName = 'AnimatedAlignSample';

  @override
  String get desc =>
      '''
  Align的隐式动画版本，只要给定的对齐发生变化，就会在给定的持续时间内自动转换孩子的位置。
  主要用来做一次性的对齐动画，不能监听其动画生命周期，如果需要反复做对齐动画，考虑用
  AnimationController 配合 AlignmentGeometryTween 和 Align使用。
  ''';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get sampleCode =>
  '''
  AlignmentGeometry alignment = Alignment.xxx;
  
  AnimatedAlign(
    alignment: alignment,
    child: Icon(Icons.directions_bike),
    duration: const Duration(milliseconds: 2000),
  ),
  ''';
}

class _Sample extends StatefulWidget {

  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {

  AlignmentGeometry alignment = Alignment.bottomLeft;

  void _changeAlign() {
    setState(() {
      alignment = alignment == Alignment.topRight ? Alignment.bottomLeft : Alignment.topRight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          child: AnimatedAlign(
            alignment: alignment,
            child: Icon(Icons.directions_bike),
            duration: const Duration(milliseconds: 2000),
          ),
        ),
        SizedBox(height: 20.0),
        RaisedButton(
            child: Text('点击触发隐式动画'),
            onPressed: () {
              _changeAlign();
            }),
      ],
    );
  }
}