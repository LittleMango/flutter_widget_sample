import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckedModeBannerSample extends BaseContentApp {

  static const String routeName = 'CheckedModeBannerSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
      '''
  在Debug模式下运行时显示标有“DEBUG” 的横幅,MaterialApp默认构建其中一个。
  在发布模式下自动会看不见。
  
  如果想要一个类似的标签，可以在release也可以看到，那么用Banner
  ''';

  @override
  String get sampleCode =>
      '''
  Center(
    child: CheckedModeBanner(
      child: Image.asset('images/img.jpeg'),
    ),
  );
  ''';
}

class _Sample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        child: CheckedModeBanner(
          child: Image.asset('images/img.jpeg'),
        ),
      ),
    );
  }
}