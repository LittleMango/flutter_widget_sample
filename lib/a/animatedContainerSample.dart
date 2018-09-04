
import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

class AnimatedContainerSample extends BaseContentApp {

  static const String routeName = 'AnimatedContainerSample';

  @override
  String get title => routeName;

  @override
  String get desc =>
  '''
  Container的动画版本，确切地说应该是隐式动画版本，
  通过给AnimatedContainer设置时间和插值器之后，当其属性发生变化的时候，会自动动画过度。
  ''';

  @override
  String get sampleCode =>
  '''
  AnimatedContainer(
    duration: const Duration(seconds: 1),
    height: height,
    foregroundDecoration: BoxDecoration(
      color: bgColor,
    ),
  );
  ''';

  @override
  Widget get contentWidget => _Sample();
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {

  Color bgColor = Colors.red;
  double height = 200.0;
  bool toggle = false;
  void _change() {
      setState(() {
        if (toggle) {
          bgColor = Colors.red;
          height = 200.0;
        } else {
          bgColor = Colors.green;
          height = 100.0;
        }
        toggle = !toggle;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedContainer(
            duration: const Duration(seconds: 1),
          height: height,
          foregroundDecoration: BoxDecoration(
            color: bgColor,
          ),
        ),
        SizedBox(height: 20.0),
        RaisedButton(
            child: Text('点击触发隐式动画'),
            onPressed: () {
              _change();
            }),
      ],
    );
  }
}