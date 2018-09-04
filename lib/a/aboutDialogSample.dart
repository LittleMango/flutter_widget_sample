import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

class AboutDialogSample extends BaseBtnApp {

  static const String routeName = 'AboutDialogSample';

  @override
  String get title => 'AboutDialogSample';

  // TODO: implement desc
  @override
  String get desc => '''
  AboutDialog。这是一个对话框，其中包含应用程序的图标，名称，版本号和版权，以及显示应用程序使用的软件许可证的按钮。\n

  要显示的AboutDialog，使用showAboutDialog。\n
  ''';

  @override
  String get buttonTitle => '显示 AboutDialog';

  @override
  // TODO: implement sampleCode
  String get sampleCode => '''
  showAboutDialog(
      context: context,
      applicationName: 'Flutter Sample',
      applicationVersion: '1.0',
      applicationIcon: Icon(Icons.home),
      applicationLegalese: '版权说明',
      children: <Widget>[
        Text('自定义子控件'),
      ],
    );
  ''';

  @override
  VoidCallback get callBack => () {
    showAboutDialog(
      context: context,
      applicationName: 'Flutter Sample',
      applicationVersion: '1.0',
      applicationIcon: Icon(Icons.home),
      applicationLegalese: '版权说明',
      children: <Widget>[
        Text('自定义子控件'),
      ],
    );
  };
}