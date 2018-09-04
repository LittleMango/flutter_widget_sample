
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

class AlertDialogSample extends BaseBtnApp {
  static const String routeName = 'AlertDialogSample';

  @override
  String get buttonTitle => '显示AlertDialog';

  @override
  VoidCallback get callBack => () {
    showDialog<Null>(
      context: context,
      barrierDismissible: false, // 点击 AlertDialog 外面不消失
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Rewind and remember'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('You will never be satisfied.'),
                new Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  };

  @override
  String get desc =>
      '''
材料设计警报对话框。

警报对话框会通知用户需要确认的情况。警报对话框具有可选标题和可选的操作列表。标题显示在内容上方，操作显示在内容下方。

如果内容太大而无法垂直放在屏幕上，则对话框将显示标题和操作，并让内容溢出。考虑使用一个滚动的小部件，如ListView控件，为内容，以避免溢出。

对于为用户提供多个选项之间选择的对话框，请考虑使用SimpleDialog。

通常作为子窗口小部件传递给showDialog，后者显示对话框。
      ''';

  @override
  String get sampleCode =>
  '''
  showDialog<Null>(
      context: context,
      barrierDismissible: false, // 点击 AlertDialog 外面不消失
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Rewind and remember'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('You will never be satisfied.'),
                new Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  ''';

  @override
  String get title => routeName;

}