import 'package:flutter/material.dart';

abstract class _Base extends StatelessWidget {

  String get desc; //控件说明
  String get title; //AppBar title
  String get sampleCode; //示例代码
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _buildItems(),
      ),
    );
  }

  Widget _buildItems();
}

abstract class BaseContentApp extends _Base {

  Widget get contentWidget;

  @override
  Widget _buildItems() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        SizedBox(height: 20.0),
        Text(desc),
        SizedBox(height: 20.0),
        contentWidget,
        SizedBox(height: 20.0),
        Text('示例代码如下:'),
        Text(sampleCode),
      ],
    );
  }
}

abstract class BaseBtnApp extends _Base {

  String get buttonTitle;

  VoidCallback get callBack;

  @override
  Widget _buildItems() {
    return ListView(
      children: <Widget>[
        Text(desc),
        RaisedButton(
            child: Text(buttonTitle),
            onPressed: callBack
        ),
        SizedBox(height: 20.0),
        Text('示例代码如下:'),
        Text(sampleCode)
      ],
    );
  }
}