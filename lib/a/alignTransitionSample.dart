import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AlignTransitionSample extends BaseContentApp {
  static const String routeName = 'AlignTransitionSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
Align的动画版本，可以为其Align.alignment属性设置动画。
AlignTransition是 animatedWidget 的子类，
不需要让 AnimationController 实现以下代码
controller.addListener(() {
  setState(() {
  });
}); 

类似 AlignTransition 的动画 widget 还有以下几个：
AnimatedBuilder、AnimatedModalBarrier、DecoratedBoxTransition、FadeTransition、PositionedTransition、RelativePositionedTransition、RotationTransition、ScaleTransition、SizeTransition、SlideTransition
''';

  @override
  String get sampleCode => '''
class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<AlignmentGeometry> alignment;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    alignment = AlignmentGeometryTween(begin: Alignment.bottomLeft, end: Alignment.topRight).animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }
  
  @override
  void dispose() { //动画记得 dispose()
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: AlignTransition(
          alignment: alignment,
          child: Icon(Icons.directions_bike)),
    );
  }
}
  ''';

  @override
  String get title => routeName;
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<AlignmentGeometry> alignment;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    alignment = AlignmentGeometryTween(
            begin: Alignment.bottomLeft, end: Alignment.topRight)
        .animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: AlignTransition(
          alignment: alignment, child: Icon(Icons.directions_bike)),
    );
  }
}
