import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BeveledRectangleBorderSample extends BaseContentApp {

  static const String routeName = 'BeveledRectangleBorderSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc =>
  '''
  类似圆角矩形RoundedRectangleBorder，不过这个是斜角矩形，
  具体效果可以操作下面的slider查看。
  
  当斜角半径超过Math.max(width/2, height/2)之后，就会呈现一个菱形，
  具体可以将slider的滑块滑动到1/2处之后。
  ''';

  @override
  String get sampleCode => '';

}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> {

  double _value = 0.0;

  void _change(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Material(
            color: Colors.redAccent,
            shape: new BeveledRectangleBorder(
              side: const BorderSide(
                width: 1.0,
                style: BorderStyle.none,
              ),
              borderRadius:new BorderRadius.circular(_value),
            ),
            child: new Container(
              padding: const EdgeInsets.all(10.0),
              child: new Text('展示文本信息', style: Theme.of(context).textTheme.display2,),
            ),
          ),
          SizedBox(height: 20.0,),
          Slider(
              value: _value,
              min: 0.0,
              max: 300.0,
              onChanged: (value){
                _change(value);
              },
          )
        ],
      ),
    );
  }
}