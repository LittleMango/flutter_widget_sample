import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class DecorationImageSample extends BaseContentApp {
  static const String routeName = 'DecorationImageSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  DecorationImage 图片装饰。用在BoxDecoration的时候会在背景层、渐变层之上，如果shape设置为Circle，则会自动裁剪。
  ''';

  @override
  String get sampleCode => '''
DecoratedBox(
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.blue,
    image: DecorationImage(image: AssetImage("images/img.jpeg"))),
  child: SizedBox(height: 100, width: 100),
)
      ''';

  @override
  String get title => routeName;
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            image: DecorationImage(image: AssetImage("images/img.jpeg"))),
        child: SizedBox(height: 100, width: 100),
      ),
    );
  }
}
