import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class DecoratedBoxSample extends BaseContentApp {
  static const String routeName = 'DecoratedBoxSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  DecoratedBox和Container类似，不过前者不能指定尺寸，
  还有一个区别就是前者的边框是填充在子widget内的，后者是在子widget外
  可以通过position指定是绘制在前景还是背景(Container则可以通过前景和背景字段指定)
  ''';

  @override
  String get sampleCode => '''
DecoratedBox(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.amber, width: 10)),
    child: SizedBox(
      height: 100,
      width: 100,
      child: Text("DecoratedBox的边框会占子widget的大小")),
)
      ''';

  @override
  String get title => routeName;
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.amber, width: 10)),
            child: SizedBox(
                height: 100,
                width: 100,
                child: Text("DecoratedBox的边框会占子widget的大小")),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.amber, width: 10)),
            child: SizedBox(
                height: 100,
                width: 100,
                child: Text("Container的边框不会占子widget的大小")),
          )
        ],
      ),
    );
  }
}
