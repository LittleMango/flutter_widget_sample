import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class DefaultTextStyleTransitionSample extends BaseContentApp {
  static const String routeName = 'DefaultTextStyleTransitionSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  DefaultTextStyle的动画版本，配合TextStyleTween、AnimationController。
  ''';

  @override
  String get sampleCode => '''
TextStyle begin = DefaultTextStyle.of(context)
        .style
        .copyWith(fontSize: 15, color: Colors.deepOrange);
TextStyle end = DefaultTextStyle.of(context)
        .style
        .copyWith(fontSize: 20, color: Colors.cyan);
_animation = TextStyleTween(begin: begin, end: end).animate(_controller);
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
  Animation<TextStyle> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _change() {
    TextStyle begin = DefaultTextStyle.of(context)
        .style
        .copyWith(fontSize: 15, color: Colors.deepOrange);
    TextStyle end = DefaultTextStyle.of(context)
        .style
        .copyWith(fontSize: 20, color: Colors.cyan);
    _animation = TextStyleTween(begin: begin, end: end).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    _change();
    return SizedBox(
      height: 150,
      child: Center(
        child: DefaultTextStyleTransition(
          style: _animation,
          child: Column(
            children: <Widget>[
              Text("DefaultTextStyle动画版本"),
              Text("DefaultTextStyle动画版本"),
              Text("DefaultTextStyle动画版本"),
            ],
          ),
        ),
      ),
    );
  }
}
