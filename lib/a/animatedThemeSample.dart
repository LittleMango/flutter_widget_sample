import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedThemeSample extends StatefulWidget {
  static const String routeName = 'AnimatedThemeSample';

  @override
  _AnimatedThemeSampleState createState() => _AnimatedThemeSampleState();
}

class _AnimatedThemeSampleState extends State<AnimatedThemeSample> {
  ThemeData _data = ThemeData.light();
  bool _isLight = true;

  void _change() {
    setState(() {
      if (_isLight) {
        _data = ThemeData.dark();
      } else {
        _data = ThemeData.light();
      }
      _isLight = !_isLight;
    });
  }

  String get desc => '''
  Theme 的隐式动画版本。
  
  AnimatedTheme会将设置的 ThemeData 应用到其所有子 widget 中(除非子 widget 自己设置了主体、样式)，
  
  如果需要做整个 App 的更换主题，可以自定义 ThemeData，然后给所有界面的 scaffold 外面包裹一个 animatedTheme，
  即可做到动画更换整个 App 的主题。
  ''';

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _data,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AnimatedThemeSample.routeName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('点击更换主题'),
                  onPressed: () {
                    _change();
                  }),
              SizedBox(height: 20.0),
              Text(desc),
            ],
          ),
        ),
      ),
    );
  }
}
