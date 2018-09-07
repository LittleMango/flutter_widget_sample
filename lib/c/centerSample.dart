import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CenterSample extends BaseContentApp {

  static const String routeName = 'CenterSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  Center 是一个 widget，它将位于父widget 可用空间的中心。
  下面示例一中，外层是一个 Row，我们让 Row 的主轴从左侧开始紧凑排列，
  将 Center 放在中间，在水平方向上，由于 Row 是紧凑排列的，所以水平方向上没有空余空间，所以看上去是三个 widget 紧挨在一起。
  我们让左右两边的widget 的高度是 Center 的两倍，就可以看出在垂直方向上，center 是居中的。
  
  Center 还有两个属性---widthFactor、heightFactor，
  这两个属性默认是1.0，不可以设置为负数。
  表示 Center 这个 widget 的宽高是其子 widget 的多少倍。
  如下面第二个示例，我们给 Center 设置widthFactor为2.0，可以看到黄色的 center 控件左右两边各多出了半个宽度的范围。
  ''';

  @override
  String get sampleCode =>
      '''
  Center(
    widthFactor: 2.0,
    heightFactor: 2.0,
    child: Container(
      height: 50.0,
      width: 50.0,
    ),
  ),
  ''';
}

class _Sample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 20.0,
              color: Colors.blueAccent,
            ),
            Center(
              child: Container(
                height: 50.0,
                width: 50.0,
                color: Colors.amber,
                alignment: Alignment.center,
                child: Text('一'),
              ),
            ),
            Container(
              height: 100.0,
              width: 20.0,
              color: Colors.blueAccent,
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Row(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 20.0,
              color: Colors.blueAccent,
            ),
            Center(
              widthFactor: 2.0,
              child: Container(
                height: 50.0,
                width: 50.0,
                color: Colors.amber,
                alignment: Alignment.center,
                child: Text('二'),
              ),
            ),
            Container(
              height: 100.0,
              width: 20.0,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ],
    );
  }
}