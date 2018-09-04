import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AnimatedModalBarrierSample extends BaseContentApp {

  static const String routeName = 'AnimatedModalBarrierSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
      '''
  动画版本的ModalBarrier，用来做半透明遮罩，防止用户点击遮罩下面的 widget，
  比如常用在对话框出现的时候。
  ''';

  @override
  String get sampleCode =>
  '''
  child: AnimatedModalBarrier(
    color: color,
    dismissible: false,
  ),
  ''';

  @override
  String get title => routeName;

}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<Color> color;
  bool visible = false;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: const Duration(seconds: 1));
    color = new ColorTween(begin: Colors.transparent, end: Colors.black38).animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          visible = false;
        });
      }
    });
  }

  void _change() {
    setState(() {
      if (!visible) {
        visible = true;
        controller.forward();
      } else {
        controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Stack(
        children: <Widget>[
          Center(
            child: RaisedButton(
                child: Text('点击触发隐式动画'),
                onPressed: () {
                  _change();
                }),
          ),
          SizedBox(
            height: visible ? 300.0 : 0.0,
            child: AnimatedModalBarrier(
              color: color,
              dismissible: false,
            ),
          ),
          AnimatedOpacity(
            opacity: visible ? 1.0 : 0.0,
            duration: controller.duration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('关闭遮罩'),
                    onPressed: () {
                      _change();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}