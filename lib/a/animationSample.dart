

import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

class AnimationSample extends BaseContentApp {

  static const String routeName = 'AnimationSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  Animation对象是Flutter动画库中的一个核心类，它生成指导动画的值。
  所以 Animation 及其子类只是记录动画值的一个载体对象，
  Animation 只是一个抽象类，我们使用的时候一般是使用其子类，最常见的就是 Tween，补间动画，
  比如
  AlignmentGeometryTween AlignmentTween BorderRadiusTween BoxConstraintsTween ColorTween 
  ConstantTween DecorationTween EdgeInsetsGeometryTween EdgeInsetsTween FractionalOffsetTween 
  IntTween MaterialPointArcTween Matrix4Tween RectTween RelativeRectTween ReverseTween 
  ShapeBorderTween SizeTween StepTween TextStyleTween ThemeDataTween
  
  只有 Animation 是无法实现动画的，还需要一个管理者，便是AnimationController
  ''';

  @override
  String get sampleCode =>
      '''
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = BorderRadiusTween(
        begin: BorderRadius.zero,
        end: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.zero,
            bottomLeft: Radius.zero,
            bottomRight: Radius.circular(50.0))
    ).animate(controller);
      ''';

  // TODO: implement title
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
        end: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.zero,
            bottomLeft: Radius.zero,
            bottomRight: Radius.circular(50.0))
    ).animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener((){
      setState(() {
        //触发 Widget 重新执行 build
        //或者可以让需要发生动画的 Widget 继承自 AnimationWidget
      });
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
        Text('下面我们以BorderRadiusTween为例子，来看看如何实现一个圆角渐变的动画'),
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
        Divider(),
        Text(_explain),
        Divider(),
      ],
    );
  }
}

String _explain =
'''
如何知道怎么使用BorderRadiusTween？

1. Ctrl/cmd 点击BorderRadiusTween，查看文档，可以看到它指向BorderRadius

2. 查看BorderRadius的文档，可以看到它指向BoxDecoration

3. 查看BoxDecoration的文档，可以看到它指向DecoratedBox和 Container

4. 完毕，所以其它补间动画同理可得。
''';