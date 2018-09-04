
import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class ActionChipSample extends BaseContentApp {

  static const String routeName = 'ActionChipSample';

  @override
  Widget get contentWidget => _ActionChip();

  @override
  String get desc =>
      '''当界面需要有动态选中按钮的时候可以考虑使用 ActionChip，
      比如直播中的弹幕，就可以用 ActionChip，因为它是动态且可以交互的，
      如果需要一些静态的按钮，则使用RaisedButton，FlatButton和 OutlineButton
  ''';

  @override
  String get sampleCode =>
      '''
  ActionChip(
            avatar: new CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: new Text('AB'),
            ),
            label: new Text('Aaron Burr'),
            onPressed: () {
              print("If you stand for nothing, Burr, what’ll you fall for?");
            }
        )
  ''';

  @override
  String get title => 'ActionChipSample';
}

class _ActionChip extends StatefulWidget {

  @override
  _ActionChipState createState() => _ActionChipState();
}

class _ActionChipState extends State<_ActionChip> {

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.0,
      runSpacing: 20.0,
      children: <Widget>[
        ActionChip(
            avatar: new CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: new Text('AB'),
            ),
            label: new Text('Aaron Burr'),
            onPressed: () {
              print("If you stand for nothing, Burr, what’ll you fall for?");
            }
        ),
        ActionChip(
            avatar: new CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: new Text('AB'),
            ),
            label: new Text('Aaron Burr'),
            onPressed: () {
              print("If you stand for nothing, Burr, what’ll you fall for?");
            }
        ),
        ActionChip(
            avatar: new CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: new Text('AB'),
            ),
            label: new Text('Aaron Burr'),
            onPressed: () {
              print("If you stand for nothing, Burr, what’ll you fall for?");
            }
        ),
      ],
    );
  }
}