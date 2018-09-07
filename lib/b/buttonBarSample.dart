import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonBarSample extends BaseContentApp {

  static const String routeName = 'ButtonBarSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  水平排列一组widget，通常是排列按钮，主要用在放置一组按钮在 Dialog 右下角。
  ''';

  @override
  String get sampleCode =>
  '''
  ButtonBar(
    children: <Widget>[
      FlatButton(
        child: Text('Cancel', style: TextStyle(color: Colors.black12),),
        onPressed: (){},
      ),
      FlatButton(
        child: Text('Sure', style: TextStyle(color: Theme.of(context).primaryColor),),
        onPressed: (){},
      ),
    ],
  ),
  ''';

}

class _Sample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150.0,
        color: Colors.amber,
        alignment: Alignment.bottomRight,
        child: ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Text('Cancel', style: TextStyle(color: Colors.black12),),
              onPressed: (){},
            ),
            FlatButton(
              child: Text('Sure', style: TextStyle(color: Theme.of(context).primaryColor),),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}