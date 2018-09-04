import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';


class AlignmentSample extends BaseContentApp {

  static const String routeName = 'AlignmentSample';
  @override
  Widget get contentWidget => Column(
    children: <Widget>[
      Text('效果如下'),
      Divider(),
      Align(
        heightFactor: 3.0,
        alignment: Alignment(-0.9, -0.9),
        child: Text('Alignment(-0.9, -0.9)'),
      ),
      Divider(),
      Align(
        heightFactor: 3.0,
        alignment: Alignment(0.0, 0.0),
        child: Text('Alignment(0.0, 0.0)'),
      ),
      Divider(),
      Align(
        heightFactor: 3.0,
        alignment: Alignment(0.9, 0.9),
        child: Text('Alignment(0.9, 0.9)'),
      ),
      Divider(),
    ],
  );

  @override
  String get desc =>
      '''
矩形内的一个点。

Alignment(0.0, 0.0)代表矩形的中心。-1.0到+1.0的距离是从矩形的一边到矩形的另一边的距离。因此，水平（或垂直）2.0单位等于矩形的宽度（或高度）。

Alignment(-1.0, -1.0) 表示矩形的左上角。

Alignment(1.0, 1.0) 代表矩形的右下角。
  ''';

  @override
  String get sampleCode =>
      '''
  Align(
    heightFactor: 3.0,
    alignment: Alignment(0.0, 0.0),
    child: Text('居中对齐'),
  ),
      ''';

  @override
  String get title => routeName;
}