import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AnimatedCrossFadeSample extends BaseContentApp {

  static const String routeName = 'AnimatedCrossFadeSample';

  @override
  String get title => routeName;

  @override
  String get desc =>
  '''
一个 widget，可以淡入淡出两个子widget（只能是两个），换句话说是隐式动画的渐入渐出过渡动画。

通过给crossFadeState属性赋值CrossFadeState.showFirst 或 CrossFadeState.showSecond来决定动画显示哪一个widget，

通过firstCurve和secondCurve属性给两个子 widget 设置动画插值器。

此widget 主要用在宽高相同的子 widget 中，当宽高不相同的时候会略显突兀。
  ''';

  @override
  String get sampleCode =>
  '''
  AnimatedCrossFade(
    duration: Duration(seconds: 2),
    firstChild: FlutterLogo(size: 100.0),
    secondChild: FlutterLogo(size: 100.0),
    crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
  );
  ''';

  @override
  Widget get contentWidget => _Sample();
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {

  bool isFirst = true;

  void _change() {
    setState(() {
      isFirst = !isFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('下面显示宽高相同的过渡',textAlign: TextAlign.center),
        AnimatedCrossFade(
          duration: const Duration(seconds: 2),
          firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
          secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
          crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
        Divider(),
        Text('下面显示宽高不相同的过渡',textAlign: TextAlign.center),
        AnimatedCrossFade(
          duration: const Duration(seconds: 2),
          firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 150.0),
          secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 50.0),
          crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
        RaisedButton(
            child: Text('点击切换动画'),
            onPressed: (){
              _change();
            }),
      ],
    );
  }
}