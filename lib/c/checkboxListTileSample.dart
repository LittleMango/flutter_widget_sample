import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckboxListTileSample extends BaseContentApp {
  static const String routeName = 'CheckboxListTileSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  带有复选框的ListTile。换句话说，带有标签的复选框。

  整个列表图块是交互式的：点击图块中的任意位置可切换复选框。
  ''';

  @override
  String get sampleCode => '''
   CheckboxListTile(
     value: _value,
     controlAffinity: ListTileControlAffinity.platform,
     isThreeLine: true,
     title: Text('设置controlAffinity'),
     secondary: Text('secondary'),
     subtitle: Text('controlAffinity: ListTileControlAffinity.platform'),
     onChanged: (value){_change(value);},
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
      child: Column(
        children: <Widget>[
          CheckboxListTile(
            value: _value,
            title: Text('标题'),
            subtitle: Text('子标题'),
            onChanged: (value){_change(value);},
          ),
          CheckboxListTile(
            value: _value,
            selected: _value,
            title: Text('设置selected属性'),
            subtitle: Text('选中之后，Text 会变色'),
            onChanged: (value){_change(value);},
          ),
          CheckboxListTile(
            value: _value,
            activeColor: Colors.redAccent,
            title: Text('设置activeColor属性'),
            subtitle: Text('改变选择的颜色'),
            onChanged: (value){_change(value);},
          ),
          CheckboxListTile(
            value: _value,
            isThreeLine: true,
            title: Text('设置isThreeLine: true'),
            subtitle: Text('第二个 Text\n第三个 Text'),
            onChanged: (value){_change(value);},
          ),
          CheckboxListTile(
            value: _value,
            dense: true,
            title: Text('设置idense: true'),
            subtitle: Text('会让字体变小，变紧凑'),
            onChanged: (value){_change(value);},
          ),
          CheckboxListTile(
            value: _value,
            secondary: Text('secondary'),
            title: Text('设置secondary'),
            subtitle: Text('secondary很奇怪的名字，效果很像 Leading，显示在最左边的一个 widget'),
            onChanged: (value){_change(value);},
          ),
          CheckboxListTile(
            value: _value,
            controlAffinity: ListTileControlAffinity.leading,
            isThreeLine: true,
            title: Text('设置controlAffinity'),
            secondary: Text('secondary'),
            subtitle: Text('controlAffinity: ListTileControlAffinity.leading'),
            onChanged: (value){_change(value);},
          ),
          CheckboxListTile(
            value: _value,
            controlAffinity: ListTileControlAffinity.trailing,
            isThreeLine: true,
            title: Text('设置controlAffinity'),
            secondary: Text('secondary'),
            subtitle: Text('controlAffinity: ListTileControlAffinity.trailing'),
            onChanged: (value){_change(value);},
          ),
          CheckboxListTile(
            value: _value,
            controlAffinity: ListTileControlAffinity.platform,
            isThreeLine: true,
            title: Text('设置controlAffinity'),
            secondary: Text('secondary'),
            subtitle: Text('controlAffinity: ListTileControlAffinity.platform'),
            onChanged: (value){_change(value);},
          ),
          Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.redAccent,
              toggleableActiveColor: Colors.lightGreen,
            ),
            child: CheckboxListTile(
              value: _value,
              controlAffinity: ListTileControlAffinity.platform,
              title: Text('扩展一下样式'),
              isThreeLine: true,
              subtitle: Text('如果需要改变样式，那么就在外面套一个 Theme，然后修改它的样式'),
              onChanged: (value){_change(value);},
            ),
          ),
        ],
      ),
    );
  }
}
