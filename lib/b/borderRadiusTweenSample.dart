import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BorderRadiusTweenSample extends BaseContentApp {

  static const String routeName = 'BorderRadiusTweenSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  对圆角做补间动画。
  
  ''';

  @override
  String get sampleCode =>
  '''
  _animation = BorderRadiusTween(begin: BorderRadius.all(Radius.circular(0.0)), end: BorderRadius.all(Radius.circular(50.0))).animate(_controller);
  ''';

}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<BorderRadius> _animation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = BorderRadiusTween(begin: BorderRadius.all(Radius.circular(0.0)), end: BorderRadius.all(Radius.circular(50.0))).animate(_controller);
    _controller.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        _controller.reverse();
      } else if (state == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.addListener(() {
      setState(() {
      });
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.rectangle,
              borderRadius: _animation.value,
            ),
          ),
        ],
      ),
    );
  }
}
