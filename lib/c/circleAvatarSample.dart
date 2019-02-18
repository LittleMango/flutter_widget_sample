import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleAvatarSample extends BaseContentApp {
  static const String routeName = 'CircleAvatarSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  通常与用户的个人资料图像一起使用，或者在没有这样的图像的情况下，显示用户的姓名缩写。
  
  如果头像要有图像，则应在backgroundImage属性中指定图像,图像将被裁剪为圆形。
  
  如果只是具有用户的姓名缩写，则通常使用Text作为子级和backgroundColor来显示。
  
  需要注意的时候，只有背景会被裁剪成圆形，也就是说如果通过 child: Image.asset('name')来设置头像的话，显示的头像就不是矩形的
  ''';

  @override
  String get sampleCode => '''
  ChoiceChip(
    label: Text('男'),
    labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
    selected: _sex == 0,
    onSelected: (select) {
      setState(() {
        _sex = select ? 0 : 1;
      });
    },
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
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100.0,
          width: 100.0,
          child: CircleAvatar(
            backgroundImage: AssetImage('images/img.jpeg'),
          ),
        )
      ],
    );
  }
}
