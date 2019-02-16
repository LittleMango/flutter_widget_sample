import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AnimatedOpacitySample extends BaseContentApp {
  static const String routeName = 'AnimatedOpacitySample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => LogoFade();

  @override
  String get desc => '''
  Opacity widget的隐式动画版本，
  动画不透明度相对昂贵，因为它需要将子画面绘制到中间缓冲区中。
  ''';

  @override
  String get sampleCode => '''
  new AnimatedOpacity(
    opacity: opacityLevel,
    duration: new Duration(seconds: 1),
     child: new FlutterLogo(),
  ),
  ''';
}

class LogoFade extends StatefulWidget {
  @override
  createState() => new LogoFadeState();
}

class LogoFadeState extends State<LogoFade> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new AnimatedOpacity(
          opacity: opacityLevel,
          duration: new Duration(seconds: 1),
          child: new FlutterLogo(),
        ),
        new RaisedButton(
          child: new Text('Fade Logo'),
          onPressed: _changeOpacity,
        ),
      ],
    );
  }
}
