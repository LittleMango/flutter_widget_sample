import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckedPopupMenuItemSample extends BaseContentApp {

  static const String routeName = 'CheckedPopupMenuItemSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
      '''
  在material设计弹出菜单中带有复选标记的menu item。

  要显示弹出菜单，请使用showMenu函数。
  
  要创建显示弹出菜单的按钮，请考虑使用PopupMenuButton。
  
  一个CheckedPopupMenuItem是48个像素高，这匹配的默认高度PopupMenuItem。
  
  水平布局使用ListTile， 复选标记是Icons.done图标，显示在ListTile.leading位置。
  ''';

  @override
  String get sampleCode =>
  '''
  class _SampleState extends State<_Sample> {

  bool _heroAndScholar = true;

  @override
  Widget build(BuildContext context) {
    return new PopupMenuButton<Commands>(
      onSelected: (Commands result) {
        switch (result) {
          case Commands.heroAndScholar:
            setState(() {
              _heroAndScholar = !_heroAndScholar;
            });
            break;
          case Commands.hurricaneCame:
            break;
        }
      },
      itemBuilder: (BuildContext context) =>
      <PopupMenuEntry<Commands>>[
        new CheckedPopupMenuItem<Commands>(
          checked: _heroAndScholar,
          value: Commands.heroAndScholar,
          child: const Text('这是一个可以复选菜单项'),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem<Commands>(
          value: Commands.hurricaneCame,
          child: const ListTile(
              leading: const Icon(Icons.star),
              title: const Text('普通菜单项')),
          ),
        ],
      );
    }
  }
  ''';
}

enum Commands {heroAndScholar, hurricaneCame }

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {

  bool _heroAndScholar = true;

  @override
  Widget build(BuildContext context) {
    return new PopupMenuButton<Commands>(
      onSelected: (Commands result) {
        switch (result) {
          case Commands.heroAndScholar:
            setState(() {
              _heroAndScholar = !_heroAndScholar;
            });
            break;
          case Commands.hurricaneCame:
            break;
        }
      },
      itemBuilder: (BuildContext context) =>
      <PopupMenuEntry<Commands>>[
        new CheckedPopupMenuItem<Commands>(
          checked: _heroAndScholar,
          value: Commands.heroAndScholar,
          child: const Text('这是一个可以复选菜单项'),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem<Commands>(
          value: Commands.hurricaneCame,
          child: const ListTile(
              leading: const Icon(Icons.star),
              title: const Text('普通菜单项')),
        ),
      ],
    );
  }
}