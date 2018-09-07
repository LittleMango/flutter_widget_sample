import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckboxSample extends BaseContentApp {

  static const String routeName = 'CheckboxSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
      '''
  Checkbox是一个 material 风格的复选框，就是只有一个可以交互的按钮
  ''';

  @override
  String get sampleCode =>
  '''
  Checkbox(
    value: _value,
    onChanged: (value){
      _change(value);
    },
  ),
  ''';
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {

  bool _value = true;

  void _change(value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            child: Text('右侧就是一个复选框'),
            onTap: (){_change(!_value);},
          ),
          Checkbox(
            value: _value,
            onChanged: (value){
              _change(value);
            },
          ),
        ],
      ),
    );
  }
}