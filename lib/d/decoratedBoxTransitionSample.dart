import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class DecoratedBoxTransitionSample extends BaseContentApp {
  static const String routeName = 'DecoratedBoxTransitionSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  DecoratedBox的动画版本
  ''';

  @override
  String get sampleCode => '''
DecoratedBoxTransition(
  decoration: _animation,
  child: SizedBox(
    height: 100,
    width: 100,
  )),
)
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
        shape: Border.all(
          color: Colors.red,
          width: 2.0,
        ));

    Decoration end = ShapeDecoration(
        color: Colors.white,
        shape: Border.all(
          color: Colors.blue,
          width: 8.0,
        ));

    _animation = DecorationTween(
      begin: begin,
      end: end
    ).animate(_controller);

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
