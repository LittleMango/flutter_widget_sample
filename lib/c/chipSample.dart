import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChipSample extends BaseContentApp {

  static const String routeName = 'ChipSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  material 设计的芯片。

 芯片是表示属性，文本，实体或动作的紧凑元素。

  提供非null onDeleted回调将导致芯片包含用于删除芯片的按钮。

  需要其中一个祖先成为Material小部件。该标签， deleteIcon和border参数不能为空。
  ''';

  @override
  String get sampleCode =>
      '''
  
  ''';
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {

  String _sample =
  '''
  Chip(
      label: Text('只有文本'),
  );  
  ''';

  Widget _widget;


  @override
  void initState() {
    super.initState();
    _change(0);
  }

  void _change(int index) {
    setState(() {
      switch(index) {
        case 0:
          _widget = Chip(
            label: Text('只有文本'),
          );
          _sample =
          '''
        Chip(
            label: Text('只有文本'),
        );
        ''';
          break;
        case 1:
          _widget = Chip(
            avatar: new CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: new Text('H'),
            ),
            label: Text('带头像'),
          );
          _sample =
          '''
          Chip(
            avatar: new CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: new Text('H'),
            ),
            label: Text('带头像'),
          );
        ''';
          break;

        case 2:
          _widget = Chip(
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            backgroundColor: Colors.amber,
            label: Text('自定义形状'),
          );
          _sample =
          '''
          Chip(
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            backgroundColor: Colors.amber,
            label: Text('带头像'),
          );
        ''';
          break;
        case 3:
          _widget = Chip(
            deleteIcon: Icon(Icons.cancel),
            deleteIconColor: Colors.lightGreen,
            onDeleted: (){},
            label: Text('增加删除按钮'),
          );
          _sample =
          '''
          Chip(
            deleteIcon: Icon(Icons.cancel),
            deleteIconColor: Colors.lightGreen,
            onDeleted: (){},
            label: Text('增加删除按钮'),
          );
        ''';
          break;
        case 4:
          _widget = Chip(
            padding: EdgeInsets.all(30.0),
            labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
            avatar: new CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: new Text('H'),
            ),
            label: Text('设置 padding'),
          );
          _sample =
          '''
          Chip(
            padding: EdgeInsets.all(20.0),
            labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
            avatar: new CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: new Text('H'),
            ),
            label: Text('设置 padding'),
          );
        ''';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(_sample),
          _widget,
          SizedBox(height: 20.0),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: <Widget>[
              RaisedButton(
                child: Text('只有文本'),
                onPressed: (){
                  _change(0);
                },
              ),
              RaisedButton(
                child: Text('带头像'),
                onPressed: (){
                  _change(1);
                },
              ),
              RaisedButton(
                child: Text('自定义形状'),
                onPressed: (){
                  _change(2);
                },
              ),
              RaisedButton(
                child: Text('增加删除按钮'),
                onPressed: (){
                  _change(3);
                },
              ),
              RaisedButton(
                child: Text('设置 padding'),
                onPressed: (){
                  _change(4);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}