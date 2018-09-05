import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackButtonIconSample extends BaseContentApp {

  static const String routeName = 'BackButtonIconSample';

  @override
  Widget get contentWidget => Center(
    child: Column(
      children: <Widget>[
        BackButtonIcon(),
        Text('只是用于显示一个后退按钮的图标，自动适配 Android 和 iOS 平台风格，没有点击效果的，如果需要有点击出栈的，请使用BackButton'),
      ],
    ),
  );

  @override
  String get desc => '';

  @override
  String get sampleCode => 'BackButtonIcon();';

  @override
  String get title => routeName;

}