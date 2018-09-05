import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AssetImageSample extends BaseContentApp {

  static const String routeName = 'AssetImageSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  AssetImage用来加载本地 assets 中的图片资源，该类可以根据不同的屏幕分辨率加载最适合当前设备分辨率的图片。
  为了给不同分辨率的设备支持最适合的图片，请在本地 assets 的图片目录下新增图片变体路径，
  格式为 Nx/形式命名的子目录，例如：
  heart.png
  1.5x/heart.png
  2.0x/heart.png
  那么在标准的1.0设备中，将加载heart.png，在1.3的设备中将加载1.5x/heart.png。
  
  Image widget 有一个命名构造器，叫做 Image.asset()，内部就是使用AssetImage来读取并且显示的，所以通过该命名构造器也是可以加载适合设备的图片。
  ''';

  @override
  String get sampleCode =>
  '''
  //由于当前测试的设备是2.0密度的，所以加载的是 images/2.0x/img.jpeg
  Image(image: AssetImage('images/img.jpeg'));
  ''';
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('images/img.jpeg'));
  }
}
