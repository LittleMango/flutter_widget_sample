import 'dart:ui' show PathOperation;
import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CloseButtonSample extends BaseContentApp {

  static const String routeName = 'CloseButtonSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
      '''
 material设计关闭按钮。

 一个CloseButton是IconButton一个“关闭”图标。按下时，关闭按钮调用Navigator.maybePop返回上一个路径。

 在全屏对话框或可能需要关闭其他操作的页面上使用CloseButton而不是BackButton。
  ''';

  @override
  String get sampleCode =>
      '''
  CloseButton();
  ''';
}

class _Sample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CloseButton(),
        ],
      ),
    );
  }
}
