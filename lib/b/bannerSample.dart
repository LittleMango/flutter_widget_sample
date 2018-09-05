import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BannerSample extends BaseContentApp {

  static const String routeName = 'BannerSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  在另一个小部件的角落上方显示对角线消息。
  可以设置Banner所在位置，可以设置到四个角落，还可以设置背景颜色，文字方向，和文字样式。
  
  同样的，CheckedModeBanner也是一个类似的widget，它在widgetApp的appbar右上角装饰了一个Debug的Banner，
  该Banner只在debug版本中出现，release版本自动消失。
  
  不过Banner则可以出现在Debug和Release版本中。

  ''';

  @override
  String get sampleCode =>
  '''
  Banner(
    message: 'Banner',
    location: BannerLocation.topEnd,
    child: Image.asset('images/img.jpeg'),
    color: Colors.redAccent,
    ),
  );
  ''';
}

class _Sample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200.0,
        height: 200.0,
        child: ClipRect(
          child: Banner(
            message: 'Banner',
            location: BannerLocation.topEnd,
            child: Image.asset('images/img.jpeg'),
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}