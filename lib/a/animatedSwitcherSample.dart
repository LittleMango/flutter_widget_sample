import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AnimatedSwitcherSample extends BaseContentApp {

  static const String routeName = 'AnimatedSwitcherSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  用来在切换子widget的时候实现过渡动画的widget。
  通过transitionBuilder: (Widget child, Animation<double> animation)参数，
  新出现的widget会用animation(其实就是from 0 to 1.0的animationController)实现动画，
  要被替代的widget会用animation.reverse()实现反转动画效果。
  
  注意：当前后两个widget是同种类型的时候，比如都是Text，那么AnimatedSwitcher并不会动画过渡，
  只会瞬间修改属性而已，如果想要强制动画过渡，则需要给Text设置不同的key值，用来指示它们完全不一样：
  key: new ValueKey<int>(_count),
  
  AnimatedSwitcher是支持多个不同类型的Widget之间的过渡，如果只有两个widget需要过渡动画，
  则可以考虑使用AnimatedCrossFade。
  ''';

  @override
  String get sampleCode =>
  '''
  new AnimatedSwitcher(
    duration: const Duration(milliseconds: 500),
    transitionBuilder: (Widget child, Animation<double> animation) {
      return new ScaleTransition(child: child, scale: animation);
    },
    child: _buildWidget(_count),
  ),
        
  ''';
}

class _Sample extends StatefulWidget {
  const _Sample({Key key}) : super(key: key);

  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return new ScaleTransition(child: child, scale: animation);
          },
          child: _buildWidget(_count),
        ),
        new RaisedButton(
          child: const Text('Increment'),
          onPressed: () {
            setState(() {
              _count += 1;
            });
          },
        ),
      ],
    );
  }
  
  Widget _buildWidget(int count) {
    count %= 3;
    switch (count) {
      case 0:
        return new Text(
          '$_count',
          key: new ValueKey<int>(_count),
          style: Theme.of(context).textTheme.display1,
        );
      case 1:
        return Image.asset('images/img.jpeg');
      case 2:
        return Container(
          height: 100.0,
          width: 100.0,
          color: Colors.blue,
        );
    }
  }
}