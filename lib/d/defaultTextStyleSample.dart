import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class DefaultTextStyleSample extends BaseContentApp {
  static const String routeName = 'DefaultTextStyleSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  指定子widget的TextStyle，可以通过TextStyle style = DefaultTextStyle.of(context).style.copyWith(fontSize: 15, color: Colors.deepOrange);来拷贝修改当前样式
  ''';

  @override
  String get sampleCode => '''
class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle style = DefaultTextStyle.of(context).style.copyWith(fontSize: 15, color: Colors.deepOrange);
    return Center(
      child: DefaultTextStyle(
        style: style,
        child: Column(
          children: <Widget>[
            Text("通过DefaultTextStyle可以指定子widget的文本样式"),
            Text("通过DefaultTextStyle可以指定子widget的文本样式"),
            Text("通过DefaultTextStyle可以指定子widget的文本样式"),
          ],
        ),
      ),
    );
  }
}
  ''';

  @override
  String get title => routeName;
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle style = DefaultTextStyle.of(context).style.copyWith(fontSize: 15, color: Colors.deepOrange);
    return Center(
      child: DefaultTextStyle(
        style: style,
        child: Column(
          children: <Widget>[
            Text("通过DefaultTextStyle可以指定子widget的文本样式"),
            Text("通过DefaultTextStyle可以指定子widget的文本样式"),
            Text("通过DefaultTextStyle可以指定子widget的文本样式"),
          ],
        ),
      ),
    );
  }
}
