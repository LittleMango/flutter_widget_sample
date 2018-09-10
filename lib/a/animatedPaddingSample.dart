import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AnimatedPaddingSample extends BaseContentApp {

  static const String routeName = 'AnimatedPaddingSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  Padding widget的隐式动画版本.
  ''';

  @override
  String get sampleCode =>
      '''
      AnimatedPadding(
        padding: EdgeInsets.symmetric(horizontal: _padding),
        child: Text('示例文本信息'),
        duration: const Duration(seconds: 1)
      ),
      ''';

}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {

  double _padding = 0.0;

  void _change() {
    setState(() {
      if (_padding < 10) {
        _padding = 30.0;
      } else {
        _padding = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedPadding(
          padding: EdgeInsets.symmetric(horizontal: _padding),
            child: Text('示例文本信息示例文本信息示例文本信息示例文本信息示例文本信息'),
            duration: const Duration(seconds: 1)
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