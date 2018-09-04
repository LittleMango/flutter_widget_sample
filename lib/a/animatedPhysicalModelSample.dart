import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AnimatedPhysicalModelSample extends BaseContentApp {

  static const String routeName = 'AnimatedPhysicalModelModel';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  PhysicalModel的动画版本，可以用来控制圆角、阴影、elevation，以及形状(圆形或者矩形)
  
  PhysicalModel会自动裁剪子 widget，而 Container 是不会的
  
  所以当需要圆角矩形的图片时，可以考虑使用PhysicalModel或其动画版本。
  
  通过给 Container 设置一个原型的 decoration 是没法达到效果的。
  
  注意：PhysicalModel的尺寸是包裹内容，所以如果子 widget 是无尺寸的，那么是看不到PhysicalModel的
  ''';

  @override
  String get sampleCode =>
  '''
  AnimatedPhysicalModel(
    duration: const Duration(seconds: 1),
    shape: _shape,
    elevation: _elevation,
    color: _color,
    shadowColor: _shadowColor,
    borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
    child: new Container(
      width: 100.0,
      height: 100.0,
      child: Image.asset('images/img.jpeg'),
     ),
  ),
  ''';

  @override
  String get title => routeName;

}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {

  BoxShape _shape = BoxShape.rectangle;
  double _elevation = 4.0;
  double _borderRadius = 0.0;
  Color _color = Colors.blue;
  Color _shadowColor = Colors.black12;

  void _change() {
    setState(() {
      if (_borderRadius <= 0) {
        _elevation = 10.0;
        _borderRadius = 50.0;
        _color = Colors.red;
        _shadowColor = Colors.lightGreen;
      } else {
        _elevation = 4.0;
        _borderRadius = 0.0;
        _color = Colors.blue;
        _shadowColor = Colors.black12;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedPhysicalModel(
          duration: const Duration(seconds: 1),
          shape: _shape,
          elevation: _elevation,
          color: _color,
          shadowColor: _shadowColor,
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
          child: new Container(
            width: 100.0,
            height: 100.0,
            child: Image.asset('images/img.jpeg'),
          ),
        ),
        SizedBox(height: 20.0),
        RaisedButton(
            child: Text('点击切换动画'),
            onPressed: (){
              _change();
            }),

      ],
    );
  }
}
