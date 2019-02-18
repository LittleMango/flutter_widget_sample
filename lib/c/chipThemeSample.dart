import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChipThemeSample extends BaseContentApp {
  static const String routeName = 'ChipThemeSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  将芯片主题应用于基于RawChip的后代小部件，如Chip， InputChip，ChoiceChip，FilterChip和ActionChip。

  芯片主题描述了应用它的芯片的颜色，形状和文本样式

  后代小部件使用ChipTheme.of获取当前主题的ChipThemeData对象 。当小部件使用ChipTheme.of时，如果主题稍后更改，则会自动重建。

  该ThemeData由给定对象Theme.of提供，通过ChipThemeData.copyWith可以复制一个默认的ThemeData。
  ''';

  @override
  String get sampleCode => '''
  ChipTheme(
    data: ChipTheme.of(context).copyWith(backgroundColor: _bgColor),
    child: Wrap(
      runSpacing: 10.0,
      spacing: 10.0,
      children: <Widget>[
        Chip(label: Text('示例 Chip')),
        Chip(label: Text('示例 Chip')),
        Chip(label: Text('示例 Chip')),
        Chip(label: Text('示例 Chip')),
      ],
    ),
  ),
  ''';
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  Color _bgColor = Colors.lightGreen;

  void _change() {
    setState(() {
      if (_bgColor == Colors.lightGreen) {
        _bgColor = Colors.amber;
      } else {
        _bgColor = Colors.lightGreen;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ChipTheme(
            data: ChipTheme.of(context).copyWith(backgroundColor: _bgColor),
            child: Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              children: <Widget>[
                Chip(label: Text('示例 Chip')),
                Chip(label: Text('示例 Chip')),
                Chip(label: Text('示例 Chip')),
                Chip(label: Text('示例 Chip')),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            child: Text('点击切换主题'),
            onPressed: () {
              _change();
            },
          ),
        ],
      ),
    );
  }
}
