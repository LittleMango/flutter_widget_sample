import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class CurvedAnimationSample extends BaseContentApp {
  static const String routeName = 'CurvedAnimationSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  理解成多样式的插值器，让animationController不再只会线性变化
  ''';

  @override
  String get sampleCode => '''
    tween.animate(
      new CurvedAnimation(
       parent: animation,
       curve: Curves.ease,
  ),
),
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
  Animation<BorderRadius> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = BorderRadiusTween(
            begin: BorderRadius.zero,
            end: BorderRadius.all(Radius.circular(100)))
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
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
    return Column(
      children: <Widget>[
        Container(
          foregroundDecoration: BoxDecoration(
            borderRadius: animation.value,
            color: Color(0x88000000),
          ),
          child: SizedBox(
            width: 200.0,
            height: 200.0,
          ),
        ),
      ],
    );
  }
}
