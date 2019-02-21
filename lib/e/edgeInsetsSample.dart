import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class EdgeInsetsSample extends BaseContentApp {
  static const String routeName = 'EdgeInsetsSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  用在Padding，设置缩进，兼容设备方向的话考虑用EdgeInsetsDirectional
  ''';

  @override
  String get sampleCode => '''
class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.lightGreen,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            color: Colors.brown,
          ),
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
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.lightGreen,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            color: Colors.brown,
          ),
        ),
      ),
    );
  }
}
