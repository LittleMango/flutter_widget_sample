import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AnimatedWidgetSample extends BaseContentApp {
  static const String routeName = 'AnimatedWidgetSample';

  @override
  String get desc => '''
AnimatedWidget是一个抽象类。

AnimatedWidget是最常见的使用动画对象，且可以监听动画生命周期和属性，比如使用 ChangeNotifier和ValueNotifier。

目前感觉最大的作用就是不需要手动调用 setState，但是需要额外创建一个AnimatedWidget的子类, 

所以更多时候我们直接使用现成的子类：

AnimatedBuilder、AnimatedModalBarrier、DecoratedBoxTransition、FadeTransition、PositionedTransition、RelativePositionedTransition、RotationTransition、ScaleTransition、SizeTransition、SlideTransition

如果要实现动画逻辑和视图分离，则使用 AnimatedBuilder
  ''';

  @override
  String get sampleCode => '''
class _AlignTransitWidget extends AnimatedWidget {

  Animation<AlignmentGeometry> animation;
  _AlignTransitWidget({Key key, this.animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      alignment: animation.value,
      child: Icon(Icons.directions_bike),
    );
  }
}
  ''';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();
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
    return _AlignTransitWidget(animation: alignment);
  }
}

// ignore: must_be_immutable
class _AlignTransitWidget extends AnimatedWidget {
  Animation<AlignmentGeometry> animation;

  _AlignTransitWidget({Key key, this.animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 300.0,
          alignment: animation.value,
          child: Icon(Icons.directions_bike),
        ),
        Divider(),
        Divider(),
      ],
    );
  }
}
