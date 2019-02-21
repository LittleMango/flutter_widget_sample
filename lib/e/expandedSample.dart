import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class ExpandedSample extends BaseContentApp {
  static const String routeName = 'ExpandedSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  A widget that expands a child of a Row, Column, or Flex.
  如果有多个expanded，那么就有factor按比例分配主轴上的空间。
  ''';

  @override
  String get sampleCode => '''
  ''';

  @override
  String get title => routeName;
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.cyan,
          ),
          Expanded(
            child: Text("expanded了，所以上下两个Container被顶到两端"),
          ),
          Container(
            height: 50,
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }
}
