import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoxConstraintsTweenSample extends BaseContentApp {

  static const String routeName = 'BoxConstraintsTweenSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
      '''
  BoxConstraintsTween用来做补间动画。
  和其它 Tween 一样的用法。
  
  ''';

  @override
  String get sampleCode =>
  '''
  _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  _animation = BoxConstraintsTween(begin: BoxConstraints.tight(Size(50.0, 100.0)), end: BoxConstraints.expand(height: 100.0)).animate(_controller);
  _controller.forward();
  ''';
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<BoxConstraints> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = BoxConstraintsTween(begin: BoxConstraints.tight(Size(50.0, 100.0)), end: BoxConstraints.loose(Size(100.0, 100.0))).animate(_controller);
    _controller.addStatusListener((status){
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.addListener(() {
      setState(() {
      });
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          constraints: _animation.value,
          color: Colors.redAccent,
        ),
        SizedBox(height: 50.0,),
      ],
    );
  }
}