import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class CurveTweenSample extends BaseContentApp {
  static const String routeName = 'CurveTweenSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  和AnimationController类似，用来作为时间插值器，但是CurveTween使用起来比较合理，因为前者需要改变controller的创建方式，
  后者只需要在Tween后面chain上就可以了。
  ''';

  @override
  String get sampleCode => '''
    BorderRadiusTween(
        begin: BorderRadius.zero,
        end: BorderRadius.all(Radius.circular(100)))
    .chain(CurveTween(curve: Curves.bounceOut))
    .animate(controller);
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
        .chain(CurveTween(curve: Curves.bounceOut))
        .animate(controller);
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
