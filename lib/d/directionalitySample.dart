import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class DirectionalitySample extends BaseContentApp {
  static const String routeName = 'DirectionalitySample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  Directionality控制文本对齐的方向，从左到右或者从右到左
  ''';

  @override
  String get sampleCode => '''
class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Text("Directionality可以控制子widget的内容方向，目前是从右到左，目前是从右到左，目前是从右到左"),
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
    return Container(
      height: 100,
      color: Colors.cyan,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Text("Directionality可以控制子widget的内容方向，目前是从右到左，目前是从右到左，目前是从右到左"),
      ),
    );
  }
}
