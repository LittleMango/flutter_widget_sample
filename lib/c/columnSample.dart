import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColumnSample extends BaseContentApp {
  static const String routeName = 'ColumnSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
 Column将子widget按列排放
 如果子控件放在一个Expanded中，那么会填充满垂直方向空余空间，如果空余控件是无限的，那么会抛异常
 Column不能滚动，如果需要滚动的话，考虑用ListView
 如果需要水平排放控件，可以用Row，
 如果只有一个子控件，可以考虑使用Align或者Center
 如果超过可用尺寸，则会用黄斜线矩形显示出来，建议用ListView代替。
  ''';

  @override
  String get sampleCode => '''
  Column(
    children: <Widget>[
      Text("text1"),
      Text("text2"),
      Text("text3"),
    ],
  ),
  ''';
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("text1"),
          Text("text2"),
          Text("text3"),
        ],
      ),
    );
  }
}
