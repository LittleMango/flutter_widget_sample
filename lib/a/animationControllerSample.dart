import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AnimationControllerSample extends BaseContentApp {

  static const String routeName = 'AnimationControllerSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
      '''
此类允许您执行以下任务：

向前或向后播放动画，或停止动画。
将动画设置为特定值。
定义动画的开始和结束值。
模拟物理世界中的阻尼

默认情况下，AnimationController在给定的持续时间内线性生成范围从0.0到1.0的值。

AnimationController需要一个TickerProvider，一般是在State<StatefulWiget>类中with一个SingleTickerProviderStateMixin。

需要在dispose方法中调用controller.dispose()，避免动画泄漏。
      ''';

  @override
  String get sampleCode =>
  '''
  AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  FadeTransition(
    opacity: _controller,
    child: Container(
      height: 150.0,
      width: 150.0,
      color: Colors.amberAccent,
    ),
  ),
  
  ''';

}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))
    ..addStatusListener((status){
      if (status == AnimationStatus.dismissed) {
        _controller.forward();
      } else if (status == AnimationStatus.completed) {
        _controller.reverse();
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
    return Column(
      children: <Widget>[
        FadeTransition(
          opacity: _controller,
            child: Container(
              height: 150.0,
              width: 150.0,
              color: Colors.amberAccent,
            ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}