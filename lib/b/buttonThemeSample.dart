import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonThemeSample extends BaseContentApp {
  static const String routeName = 'ButtonThemeSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  ButtonTheme和其它 Theme类似，都是一种 widget， 它是一种可以控制子 widget 相应样式的 widget。
  比如 ButtonTheme 控制 Button 的样式，TextTheme 控制 Text 的样式。
  
  样式存储在对应的 Data 中，以 ButtonTheme 为例，对应的 Data 为 ButtonThemeData。
  
  如何获取 XXXTheme 对应的 xxxThemeData？
  通过 XXXTheme.of(context)，即可获取上下文对应的主题数据。
  
  每个 ThemeData 的对象都有一个 copyWith 方法，通过该方法可以创建一个 ThemeData 的副本。
  
  每个 XXXTheme widget 都有一个 data 的属性，用来设置 XXXThemeData，所以我们可以通过上面的操作拿到当前主题对应的 Data，
  
  通过 copyWith()方法进行部分样式的修改，然后将结果设置给 XXXTheme 这个 widget 下的 data 属性，即可达到局部修改主题样式的目的。
  ''';

  @override
  String get sampleCode => '''
  ButtonTheme(
    textTheme: ButtonTextTheme.accent,
    height: 150.0,
    shape: CircleBorder(),
    child: RaisedButton(
      child: Text('自定义ButtonTheme'),
      onPressed: (){},
    ),
  ),
  ''';
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonTheme(
        textTheme: ButtonTextTheme.accent,
        height: 150.0,
        shape: CircleBorder(),
        child: RaisedButton(
          child: Text('自定义ButtonTheme'),
          onPressed: () {},
        ),
      ),
    );
  }
}
