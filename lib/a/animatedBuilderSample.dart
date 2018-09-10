import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

class AnimatedBuilderSample extends BaseContentApp {

  static const String routeName = 'AnimatedBuilderSample';

  @override
  String get desc =>
  '''
  当 widget 的动画逻辑比较复杂的时候考虑使用AnimatedBuilder来分离动画逻辑，
  如果动画逻辑简单，则使用 AnimatedWidget 及其子类实现。
  
  将动画逻辑从图层树中剥离开来可以提高性能，因为这样每次状态更新的时候不需要重新加载
  相应的图层。
  ''';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => Spinner();

  @override
  String get sampleCode =>
  '''
  new AnimatedBuilder(
    animation: _controller,
    child: new Container(width: 200.0, height: 200.0, color: Colors.green),
    builder: (BuildContext context, Widget child) {
      return new Transform.rotate(
        angle: _controller.value * 2.0 * Math.pi,
        child: child,
      );
    },
  );
  ''';
}

class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => new _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(height: 100.0, color: Colors.green),
      builder: (BuildContext context, Widget child) {
        return Transform.scale(
          scale: _controller.value ,
          child: child,
        );
      },
    );
  }
}