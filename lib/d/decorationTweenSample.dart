import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class DecorationTweenSample extends BaseContentApp {
  static const String routeName = 'DecorationTweenSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  DecorationTween用来做动画，传入一个begin和一个end，配合AnimationController以及DecoratedBoxTransition
  ''';

  @override
  String get sampleCode => '''
Decoration begin = ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          side: BorderSide(color: Colors.blue),
        ));

Decoration end = ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(color: Colors.greenAccent),
        ));

_animation = DecorationTween(begin: begin, end: end).animate(_controller);
      ''';

  @override
  String get title => routeName;
}

class _Sample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SampleState();
}

class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<Decoration> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    Decoration begin = ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          side: BorderSide(color: Colors.blue),
        ));

    Decoration end = ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(color: Colors.greenAccent),
        ));

    _animation = DecorationTween(begin: begin, end: end).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
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
    return Center(
      child: DecoratedBoxTransition(
          decoration: _animation,
          child: SizedBox(
            height: 100,
            width: 100,
          )),
    );
  }
}
