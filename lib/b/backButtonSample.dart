import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackButtonSample extends BaseContentApp {
  static const String routeName = 'BackButtonSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  一个返回上一个界面的按钮，自动适配 iOS 和 Android 的图标风格。点击的时候自动 pop。
  
  是IconButton与BackButtonIcon的结合体。
  
  使用BackButton时，请考虑使用 ModalRoute.of(context)?.canPop以检查是否可以弹出当前路径。
  
  如果该值为假（例如，因为当前界面是导航栈第一个界面），则按下按钮时BackButton将不会有任何效果，这可能会使用户感到沮丧。
  ''';

  @override
  String get sampleCode => 'BackButton(color: Colors.blueAccent);';
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          BackButton(color: Colors.blueAccent),
          Text('点击会返回上一个界面'),
        ],
      ),
    );
  }
}
