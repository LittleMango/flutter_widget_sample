import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClampingScrollPhysicsSample extends StatefulWidget {
  static const String routeName = 'ClampingScrollPhysicsSample';

  @override
  _ClampingScrollPhysicsSampleState createState() =>
      _ClampingScrollPhysicsSampleState();
}

class _ClampingScrollPhysicsSampleState
    extends State<ClampingScrollPhysicsSample> {
  bool _isBouncing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ClampingScrollPhysicsSample.routeName),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics:
                _isBouncing ? BouncingScrollPhysics() : ClampingScrollPhysics(),
            children: <Widget>[
              Text(
                  'BouncingScrollPhysics 允许滚动偏移超出内容范围，但随后将内容反弹回这些边界的边缘，如iOS的效果'),
              SizedBox(
                height: 50.0,
              ),
              Text('ClampingScrollPhysics 是 Android 的效果'),
              SizedBox(
                height: 50.0,
              ),
              RaisedButton(
                  child: Text(
                      "${_isBouncing ? '当前是iOS' : '当前是Android'}效果，上下拖动查看效果"),
                  onPressed: () {
                    setState(() {
                      _isBouncing = !_isBouncing;
                    });
                  }),
              SizedBox(
                height: 500.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
