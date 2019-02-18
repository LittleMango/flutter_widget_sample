import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BorderSideSample extends BaseContentApp {
  static const String routeName = 'BorderSideSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  Border 是由四条边组成的，这四条边的类型就是BorderSide，
  可以设置宽度和颜色
  ''';

  @override
  String get sampleCode => '''
  border: const Border(
    top: const BorderSide(width: 1.0, color: Colors.blueAccent),
    left: const BorderSide(width: 1.0, color: Colors.amber),
    right: const BorderSide(width: 1.0, color: Colors.redAccent),
    bottom: const BorderSide(width: 1.0, color: Colors.deepPurpleAccent),
    ),
  ''';
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
              border: const Border(
                top: const BorderSide(width: 1.0, color: Colors.blueAccent),
                left: const BorderSide(width: 1.0, color: Colors.amber),
                right: const BorderSide(width: 1.0, color: Colors.redAccent),
                bottom: const BorderSide(
                    width: 1.0, color: Colors.deepPurpleAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
