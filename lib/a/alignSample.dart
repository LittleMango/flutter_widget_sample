import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';


class AlignSample extends BaseContentApp {

  static const String routeName = 'AlignSample';
  @override
  Widget get contentWidget => Column(
    children: <Widget>[
      Text('效果如下'),
      Divider(),
      Align(
        alignment: Alignment.centerLeft,
        child: Text('居中左对齐'),
      ),
      Divider(),
      Align(
        heightFactor: 3.0,
        alignment: Alignment.center,
        child: Text('居中，且高度尺寸因子为3.0，即高度是子控件的3倍'),
      ),
      Divider(),
    ],
  );

  @override
  String get desc =>
  '''
一个widget，用于将其子widget与其自身对齐，并根据子widget的大小自行调整大小。

例如，要对齐右下方，则使用Alignment.bottomRight。

如果不给Align 设置约束和尺寸因子，则其宽高为内部子控件的宽高(wrap_content)

如果尺寸因子(widthFactor/heigthFactor)为非null，则此Align的宽高将是子控件的宽高与尺寸因子的乘积。

例如，如果widthFactor是2.0，那么Align宽度将始终是其子宽度的两倍。
  ''';

  @override
  String get sampleCode =>
      '''
  Column(
    children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Text('居中左对齐'),
      ),
      Align(
        heightFactor: 3.0,
        alignment: Alignment.center,
        child: Text('居中，且高度尺寸因子为3.0，即高度是子控件的3倍'),
      ),
    ],
  );
      ''';

  @override
  String get title => 'AlignSample';
}