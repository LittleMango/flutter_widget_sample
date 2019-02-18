import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChoiceChipSample extends BaseContentApp {
  static const String routeName = 'ChoiceChipSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  material设计选择芯片。

  ChoiceChip 是一种 Chip，主要用来表示是否选中。
  Chip除了展示外，还有一个删除操作。
  ''';

  @override
  String get sampleCode => '''
  ChoiceChip(
    label: Text('男'),
    labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
    selected: _sex == 0,
    onSelected: (select) {
      setState(() {
        _sex = select ? 0 : 1;
      });
    },
  ),
  ''';
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => new _SampleState();
}

class _SampleState extends State<_Sample> {
  int _sex = 0;
  bool _film = false;
  bool _music = false;
  bool _travel = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('请选择您的性别'),
        SizedBox(
          height: 10.0,
        ),
        Wrap(
          spacing: 10.0,
          children: <Widget>[
            ChoiceChip(
              label: Text('男'),
              labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
              selected: _sex == 0,
              onSelected: (select) {
                setState(() {
                  _sex = select ? 0 : 1;
                });
              },
            ),
            ChoiceChip(
              label: Text('女'),
              labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
              selected: _sex == 1,
              onSelected: (select) {
                setState(() {
                  _sex = select ? 1 : 0;
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Text('请选择您的喜好'),
        SizedBox(
          height: 10.0,
        ),
        Wrap(
          spacing: 10.0,
          children: <Widget>[
            ChoiceChip(
              label: Text('电影'),
              labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
              selected: _film,
              onSelected: (select) {
                setState(() {
                  _film = select;
                });
              },
            ),
            ChoiceChip(
              label: Text('音乐'),
              avatar: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(Icons.music_note),
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
              selected: _music,
              onSelected: (select) {
                setState(() {
                  _music = select;
                });
              },
            ),
            ChoiceChip(
              label: Text('旅游'),
              labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
              selected: _travel,
              onSelected: (select) {
                setState(() {
                  _travel = select;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
