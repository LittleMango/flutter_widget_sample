import 'package:flutter/material.dart';

class BottomSheetSample extends StatelessWidget {

  static const String routeName = 'BottomSheetSample';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(BottomSheetSample.routeName),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          //这里一定需要抽出一个StatelessWidget/StatefulWidget，这样在新widget 中的build 方法中传入的 context 才是在Scaffold下面的。如果直接传入第八行代码的 context 参数，则无法找到Scaffold。
          child: _BottomSheet(),
        ),
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {

  String get des1 =>
  '''
  showModalBottomSheet是模态弹出一个 bottomSheet，将会阻止用户与 bottomSheet 背后的主体内容交互，

  ''';

  String get des2 =>
      '''
  showBottomSheet的调用是Scaffold.of(context).showBottomSheet(BuildWidget)；
  
  这里需要注意其中的 context 参数，Scaffold.of会通过传入的 context 参数在找到其所代表的 widget，并且在往图层树上方搜索，视图寻找到Scaffold这个 widget，
  所以如果传入context 是在Scaffold之上的 context，则会找不到Scaffold，也就不会弹出 bottomSheet。 具体可以看代码注释。

  ''';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('showModalBottomSheet'),
          onPressed: () {
            showModalBottomSheet(context: context, builder: (BuildContext context) {
              return Image.asset('images/img.jpeg');
            });
          },
        ),
        SizedBox(
          height: 20.0,
        ),
        RaisedButton(
          child: Text('Scaffold.of(context).showBottomSheet'),
          onPressed: () {
            Scaffold.of(context).showBottomSheet((context) {
              return Image.asset('images/img.jpeg');
            });
          },
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(des1),
        SizedBox(
          height: 20.0,
        ),
        Text(des2),
      ],
    );
  }
}