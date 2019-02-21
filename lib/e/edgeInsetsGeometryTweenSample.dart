import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class EdgeInsetsGeometryTweenSample extends BaseContentApp {
  static const String routeName = 'EdgeInsetsGeometryTweenSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  用来动画改变padding的缩进
  ''';

  @override
  String get sampleCode => '''
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
  Animation<EdgeInsets> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = EdgeInsetsTween(begin: EdgeInsets.all(0), end: EdgeInsets.all(10)).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.addListener((){
      setState(() {
      });
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.lightGreen,
        child: Padding(
          padding: _animation.value,
          child: Container(
            color: Colors.brown,
          ),
        ),
      ),
    );
  }
}