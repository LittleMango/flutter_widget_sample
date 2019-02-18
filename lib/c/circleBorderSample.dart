import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleBorderSample extends BaseContentApp {
  static const String routeName = 'CircleBorderSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  CircleBorder用来限定一个 widget 的形状为圆形，在这个上下文中超出圆形区域范围之外的内容会被裁剪。
  常配合ShapeDecoration类一起使用。
  ''';

  @override
  String get sampleCode => '''
  Container(
    height: 100.0,
    width: 100.0,
    decoration: ShapeDecoration(
      shape: CircleBorder(),
      image: DecorationImage(image: AssetImage('images/img.jpeg')),
    ),
  ),
  ''';
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => new _SampleState();
}

class _SampleState extends State<_Sample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              image: DecorationImage(image: AssetImage('images/img.jpeg')),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text('上面的代码为：\n'
              '''
            Container(
              height: 100.0,
              width: 100.0,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                image: DecorationImage(image: AssetImage('images/img.jpeg')),
            ),
          ),
              '''),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 100.0,
            width: 100.0,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              image: DecorationImage(image: AssetImage('images/img.jpeg')),
            ),
            child: Image.asset('images/img.jpeg'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text('上面的代码为：\n'
              '''
            Container(
              height: 100.0,
              width: 100.0,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                image: DecorationImage(image: AssetImage('images/img.jpeg')),
              ),
              child: Image.asset('images/img.jpeg'),
            ),
              '''),
          SizedBox(
            height: 20.0,
          ),
          Text(
              '可以看出 CircleBorder 会限制其所修饰 widget 的显示范围，那些不是被修饰 widget 的子 widget 的 widget 不会被裁剪成圆形')
        ],
      ),
    );
  }
}
