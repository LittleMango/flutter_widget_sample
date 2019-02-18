import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show ImageFilter;

// ignore: must_be_immutable
class BackdropFilterSample extends BaseContentApp {
  static const String routeName = 'BackdropFilterSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  BackdropFilter可以用来实现高斯模糊，它会模糊子 widget 的背景。
  关于层次的证明例子如下：
  1. 如果BackdropFilter的子widget 是一张图片，那么是看不到效果的，因为内容层会完全覆盖掉模糊层,如下面第一张风景图，所以模糊层不在内容层之上；
  2. 以 Text 为例子，可以看到文字是清晰的，所以也可以得出模糊层在内容层之下；
  3. 为 Container 设置背景颜色，然后将其作为BackdropFilter的子 widget，可以看到高斯模糊效果。
  
  综上得出BackdropFilter是对子 widget 的背景层做混合，产生一个新的背景层(含有半透明)。
  
  注意： 这种效果相对昂贵。
  ''';

  @override
  String get sampleCode => '''
  BackdropFilter(
    filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
    child: Text('毛玻璃',
      style: Theme.of(context).textTheme.display3),
    ),
  );
  ''';
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 300.0,
            width: 300.0,
            child: FlutterLogo(),
          ),
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  BackdropFilter(
                    filter: new ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Image.asset('images/img.jpeg'),
                  ),
                  Text('图片是看不出效果的'),
                ],
              ),
              ClipRect(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child:
                      Text('毛玻璃', style: Theme.of(context).textTheme.display3),
                ),
              ),
              ClipRect(
                child: BackdropFilter(
                  filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                        color: Colors.red.shade200.withOpacity(0.5)),
                    child: Text('毛玻璃'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
