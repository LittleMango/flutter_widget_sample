import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircularProgressIndicatorSample extends BaseContentApp {
  static const String routeName = 'CircularProgressIndicatorSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  material设计 圆形 进度指示器，旋转以指示应用程序正忙。

  显示沿圆圈进度的小部件。循环进度指标有两种：

  确定。确定进度指标在每个时间点都有一个特定的值，并且该值应该从0.0单调增加到1.0，此时指标就完成了。要创建确定的进度指示器，请使用介于0.0和1.0之间的非空值。
  
  不确定。传入 null 值，就会一直转圈圈。
  ''';

  @override
  String get sampleCode => '''
  CircularProgressIndicator(
    strokeWidth: 2.0,
    value: AlwaysStoppedAnimation(Colors.redAccent),
    valueColor: _animation,
  ),
  ''';
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => new _SampleState();
}

class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _redColor;
  Animation<Color> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _redColor = AlwaysStoppedAnimation(Colors.redAccent);
    _animation =
        ColorTween(begin: Colors.redAccent, end: Colors.deepPurpleAccent)
            .animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text('设置 value为0.4, 合理的范围为[0, 1]'),
          SizedBox(
            height: 10.0,
          ),
          CircularProgressIndicator(
            value: 0.4,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text('设置 value 为 null，则会一直转圈圈'),
          SizedBox(
            height: 10.0,
          ),
          CircularProgressIndicator(),
          SizedBox(
            height: 20.0,
          ),
          Text('指定颜色'),
          SizedBox(
            height: 10.0,
          ),
          CircularProgressIndicator(
            valueColor: _redColor,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text('指定颜色变化动画'),
          SizedBox(
            height: 10.0,
          ),
          CircularProgressIndicator(
            value: 0.9,
            valueColor: _animation,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text('设置宽度'),
          SizedBox(
            height: 10.0,
          ),
          CircularProgressIndicator(
            strokeWidth: 2.0,
          ),
        ],
      ),
    );
  }
}
