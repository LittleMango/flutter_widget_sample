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
  String get desc => '''
  Checkbox是一个 material 风格的复选框，就是只有一个可以交互的按钮，
  如果要使用 Checkbox，那么需要其祖先是一个 Material widget。
  
  当tristate属性设置为 true 的时候，checkbox 的 value 有三个值:true、false、null，其中 null 对应的图标是一个破折号。
  ''';

  @override
  String get sampleCode => '''
  Checkbox(
    tristate: true/false
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
  bool _value1 = true;

  void _change(value) {
    setState(() {
      _value = value;
    });
  }

  void _change1(value) {
    setState(() {
      _value1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('右侧就是一个复选框'),
              Checkbox(
                value: _value,
                onChanged: (value) {
                  _change(value);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('右侧就是一个拥有三个状态的复选框'),
              Checkbox(
                tristate: true,
                value: _value1,
                onChanged: (value) {
                  _change1(value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
