import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/rendering.dart';

// ignore: must_be_immutable
class AnimatedSizeSample extends BaseContentApp {

  static const String routeName = 'AnimatedSizeSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  只要给定子项的大小发生更改，就会在给定的持续时间内自动转换其大小。
  
  注意：当给定子项大小发生改变的时候有以下需要注意的地方
  1. 子 widget 的大小会立马变成最终值，没有动画
  2. AnimatedSize 的大小会动画变化成子 widget 的大小。
  
  所以如果我们将子 widget 设置成一张图片，让图片容器变大，在足够慢的动画情况下我们可以看到图片内容立即变大，
  然后 AnimatedSize 呈现揭露效果直至呈现完整的图片。
  
  当我们让图片容器变小的时候，图片容器立即变到最小状态没有动画，而 AnimatedSize 会逐渐缩小到图片容器的大小
  
  ''';

  @override
  String get sampleCode =>
  '''
  AnimatedSize(
    child: Container(
      height: _height,
      width: _width,
      child: Image.asset('images/img.jpeg'),
    ),
    duration: const Duration(seconds: 5),
    vsync: this
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

  double _height = 150.0;
  double _width = 150.0;


  void _change() {
    setState(() {
      if (_height <= 100) {
        _height = 150.0;
        _width = 150.0;
      } else {
        _height = 80.0;
        _width = 80.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedSize(
            child: Container(
              height: _height,
              width: _width,
              child: Image.asset('images/img.jpeg'),
            ),
            duration: const Duration(seconds: 5),
            vsync: this
        ),
        SizedBox(height: 20.0),
        RaisedButton(
            child: Text('点击切换动画'),
            onPressed: (){
              _change();
            }),
      ],
    );
  }
}
