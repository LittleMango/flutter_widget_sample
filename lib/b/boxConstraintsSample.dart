import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoxConstraintsSample extends BaseContentApp {
  static const String routeName = 'BoxConstraintsSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  BoxConstraints用来给 widget 增加宽高约束。
  
  loose：表示最大尺寸，如果实际尺寸小于 loose 设置的尺寸，则最终采用实际尺寸，否则采用 loose 的尺寸。如示例一：
  
  ''';

  @override
  String get sampleCode => '示例代码上面每个示例都配备了';
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('height = 50'),
        Text('width = 50'),
        Text('constraints: BoxConstraints.loose(Size(100.0, 100.0)),'),
        Text(''),
        Container(
          height: 50.0,
          width: 50.0,
          constraints: BoxConstraints.loose(Size(100.0, 100.0)),
          color: Colors.redAccent,
          child: Text('宽高50'),
        ),
        SizedBox(
          height: 50.0,
        ),
        Text('tight: widget 的最终尺寸和约束设置的一致，不管 widget 本身是否设置有宽高'),
        Text('height = 50'),
        Text('width = 50'),
        Text('constraints: BoxConstraints.tight(Size(100.0, 100.0)),'),
        Text('效果如示例二：'),
        SizedBox(height: 20.0),
        Container(
          height: 50.0,
          width: 50.0,
          constraints: BoxConstraints.tight(Size(100.0, 100.0)),
          color: Colors.redAccent,
          child: Text('宽高100'),
        ),
        SizedBox(
          height: 50.0,
        ),
        Text('expand: 让 widget 填充满父widget 所有可用空间'),
        Text('如果在BoxConstraints.expand()中指定了宽高，则会扩充到指定的宽高'),
        Text('如果不指定扩充的大小，然后父widget 在这个轴上面的尺寸是无限大的，那么约束会失败，导致看不出任何效果'),
        Text('constraints: BoxConstraints.expand(height: 100.0)'),
        Text('效果是横轴填充父类，纵轴高度填充100，如示例三：'),
        SizedBox(height: 20.0),
        Container(
          constraints: BoxConstraints.expand(height: 100.0),
          color: Colors.redAccent,
          child: Text('高100'),
        ),
        SizedBox(
          height: 50.0,
        ),
        Text('minHeight, minWidth, maxHeight, maxWidth'),
        Text('这四个属性的作用就不解释了，最终只要设置的数值在最大和最小之间，那么结果就是取widget 设置的数值'),
        Text('否则超过最大限制则取最大值，超过最小限制，则取最小值'),
        Text('height = 50'),
        Text('width = 50'),
        Text('如示例四：'),
        SizedBox(height: 20.0),
        Container(
          height: 50.0,
          width: 50.0,
          constraints: BoxConstraints(
              minHeight: 10.0,
              minWidth: 10.0,
              maxHeight: 100.0,
              maxWidth: 100.0),
          color: Colors.redAccent,
          child: Text('宽高50'),
        ),
        SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
