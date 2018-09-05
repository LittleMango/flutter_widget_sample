import 'package:flutter/material.dart';

class AppBarSample extends StatelessWidget {
  static const String routeName = 'AppBarSample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'menu',
            onPressed: _restitchDress,
          ),
          title: new Text('AppBarSample'),
          flexibleSpace: Image.asset(
            'images/img.jpeg',
            fit: BoxFit.fill,
          ),
          bottom: PreferredSize(
            child: Text('Bottom',
                style: TextStyle(color: Colors.white, fontSize: 18.0)),
            preferredSize: Size.fromHeight(50.0),
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.playlist_play),
              tooltip: 'Air it',
              onPressed: _airDress,
            ),
            new IconButton(
              icon: new Icon(Icons.playlist_add_check),
              tooltip: 'Repair it',
              onPressed: _repairDress,
            ),
          ],
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(_appBarExplain),
              ),
              Image.asset('images/appbar_sample.png'),
            ],
          ),
        ),
      ),
    );
  }

  void _airDress() {}

  void _restitchDress() {}

  void _repairDress() {}
}

String _appBarExplain = '''
appBar由toolBar和可能的其他widget组成，例如 TabBar和FlexibleSpaceBar。AppBar通常会使用IconButton公开一个或多个常见操作，对于不太常见的操作（有时称为“溢出菜单”），可选地后跟 PopupMenuButton。

AppBar用于Scaffold.appBar属性，该属性将AppBar放置在屏幕顶部的固定高度widget中。对于可滚动的AppBar，请参阅SliverAppBar，它将AppBar嵌入到Sliver中以便在CustomScrollView中使用。

AppBar 在底部（如果有）上方显示toolBar 的 widge: leading，title和action。所述底部通常用于一个的TabBar。如果指定了flexibleSpace窗口小部件，则它将堆叠在toolBar和底部widget后面。下图显示了当编写语言从左到右（例如英语）时，每个插槽在toolBar中的显示位置：

''';
