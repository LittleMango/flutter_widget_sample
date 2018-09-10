import 'dart:ui' show PathOperation;
import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColorTweenSample extends BaseContentApp {

  static const String routeName = 'ColorTweenSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
      '''
 两种颜色之间的插值。
  ''';

  @override
  String get sampleCode =>
      '''
  class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {

    AnimationController _controller;
    Animation<Color> _animation;


    @override
    void initState() {
      super.initState();
      _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
      _animation = ColorTween(begin: Colors.deepPurpleAccent, end: Colors.deepOrange).animate(_controller);
      _controller.addListener(() {
        setState(() {
        });
      });
      _controller.repeat();
    }

    @override
    Widget build(BuildContext context) {
      return Center(
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: _animation,
            ),
          ],
        ),
      );
    }
  }
  ''';
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<Color> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = ColorTween(begin: Colors.deepPurpleAccent, end: Colors.yellowAccent).animate(_controller);
    _controller.addListener(() {
      setState(() {
      });
    });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: _animation,
          ),
        ],
      ),
    );
  }
}
