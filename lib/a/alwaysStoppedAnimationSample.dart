import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AlwaysStoppedAnimationSample extends BaseContentApp {
  static const String routeName = 'AlwaysStoppedAnimationSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => "动画有一种是固定动画，用来一些只有动画属性，但是却需要一个固定值的属性中";

  @override
  String get sampleCode => '''
  _animation = AlwaysStoppedAnimation(Colors.red);
  ''';

  @override
  String get title => routeName;
}

class _Sample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  Animation<Color> _animation;

  @override
  void initState() {
    super.initState();
    _animation = AlwaysStoppedAnimation(Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: _animation,
      ),
    );
  }
}
