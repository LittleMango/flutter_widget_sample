import 'package:flutter/material.dart';

class BottomNavigationBarSample extends StatelessWidget {

  static const String routeName = 'BottomNavigationBarSample';

  @override
  Widget build(BuildContext context) {
    return _Sample();
  }

}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {

  int _selectIndex = 0;

  String get des =>
      '''
  显示在应用程序底部的material widget，用于在少量视图中进行选择，通常在3到5之间。
  
  其中每一个 item 由文本标签，图标或两者结合的形式组成，它提供了应用程序顶级视图之间的快速导航。对于较大的屏幕，侧面导航可能更适合。
  
  BottomNavigationBar通常与Scaffold结合使用，它作为Scaffold.bottomNavigationBar参数提供。
  
  BottomNavigationBar的type更改其item的显示方式。
  如果未指定，则当少于四个项时，它会自动设置为BottomNavigationBarType.fixed， 否则为BottomNavigationBarType.shifting。
  
  BottomNavigationBarType.fixed:
  当少于四个项目时的默认值。如果选中的项为非空，则使用fixedColor渲染，否则使用主题的ThemeData.primaryColor。
   BottomNavigationBar的背景颜色是默认的material背景颜色---ThemeData.canvasColor（基本上是不透明的白色）。
  
  BottomNavigationBarType.shifting:
  当有四个或更多项时的默认值。所有项目都以白色呈现， BottomNavigationBar的背景颜色与所选item的BottomNavigationBarItem.backgroundColor相同 。
  在这种情况下， 我们可以给每个项目将设置不同的背景颜色。
  
  ''';

  void _change(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(BottomNavigationBarSample.routeName),
      ),
      body: ListView(
        children: <Widget>[
          Text(des),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.build), title: Text('build')),
          BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('star')),
          BottomNavigationBarItem(icon: Icon(Icons.satellite), title: Text('satellite')),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text('ac_unit')),
        ],
        currentIndex: _selectIndex,
        onTap: (index) {
          _change(index);
        },
      ),
    );
  }
}