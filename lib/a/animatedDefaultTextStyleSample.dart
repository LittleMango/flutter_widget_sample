import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AnimatedDefaultTextStyleSample extends BaseContentApp {

  static const String routeName = 'AnimatedDefaultTextStyleSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  DefaultTextStyle的隐式动画版本，给定的样式发生更改时会自动动画过渡。
  注意，其子 Widget 不能设置文本样式，否则会应用子 Widget 的样式，而看不出效果。
  ''';

  @override
  String get sampleCode =>
  '''
  TextStyle _style = const TextStyle(color: Colors.blue, fontSize: 18.0);
  
  AnimatedDefaultTextStyle(
    child: Text('示例文本信息'),
    style: _style,
    duration: const Duration(seconds: 2)
   );
  ''';
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {

  TextStyle _style = const TextStyle(color: Colors.blue, fontSize: 18.0);

  void _change() {
    setState(() {
      if (_style.fontSize <= 20) {
        _style = const TextStyle(color: Colors.deepOrange, fontSize: 25.0);
      } else {
        _style = const TextStyle(color: Colors.blue, fontSize: 18.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedDefaultTextStyle(
            child: Text('示例文本信息'),
            style: _style,
            duration: const Duration(seconds: 2)
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