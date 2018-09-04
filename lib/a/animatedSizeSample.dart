import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AnimatedSizeSample extends BaseContentApp {

  static const String routeName = 'AnimatedSizeSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  只要给定子项的大小发生更改，就会在给定的持续时间内自动转换其大小。
  
  目前测试有bug，当子widget缩小的时候，子widget会立即变换成最终值，然后AnimatedSize则是正确地缩小。
  
  已经提了issue: https://github.com/flutter/flutter/issues/21384
  ''';

  @override
  String get sampleCode => '';

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
              color: Colors.amberAccent,
            ),
            duration: const Duration(seconds: 1),
            vsync: this),
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