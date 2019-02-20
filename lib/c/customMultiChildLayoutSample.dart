import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class CustomMultiChildLayoutSample extends BaseContentApp {
  static const String routeName = 'CustomMultiChildLayoutSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  CustomMultiChildLayout可以对其子控件进行绝对布局，即可以指定宽高、位置。
  具体是通过给它设置MultiChildLayoutDelegate代理，在代理中，通过performLayout(Size size)，接收父控件的大小，
  通过layoutChild设置子控件宽高，通过positionChild摆放子控件。
  
  CustomMultiChildLayout需要一组LayoutId作为子控件，每个LayoutId有一个id字符串属性，用来唯一标志一个子控件
  ''';

  @override
  String get sampleCode => '''
    Container(
          width: 200.0,
          height: 100.0,
          color: Colors.yellow,
          child: CustomMultiChildLayout(
            delegate: TestLayoutDelegate(),
            children: <Widget>[
              LayoutId(
                id: TestLayoutDelegate.title,
                child: new Text("This is title",
                    style: TextStyle(fontSize: 20.0, color: Colors.black)),
              ),
              LayoutId(
                id: TestLayoutDelegate.description,
                child: new Text("This is description",
                    style: TextStyle(fontSize: 14.0, color: Colors.red)),
              ),
            ],
          ),
        ),
        
class TestLayoutDelegate extends MultiChildLayoutDelegate {
  
  bool _needRefresh = true;
  
  static const String title = 'title';
  static const String description = 'description';

  @override
  void performLayout(Size size) {
    //底部、右对齐
    //1. 设置子控件的宽高最大为父控件的宽高
    final BoxConstraints constraints = BoxConstraints(maxWidth: size.width, maxHeight: size.height);

    //2. 测量子控件大小，其宽高不能超过约束的宽高
    final Size titleSize = layoutChild(title, constraints);
    final Size descSize = layoutChild(description, constraints);

    //3. 摆放子控件
    //3.1. 先放desc
    positionChild(description, new Offset(size.width - descSize.width, size.height - descSize.height));
    //3.2. 再放title
    positionChild(title, new Offset(size.width - titleSize.width, size.height - descSize.height - titleSize.height));

  }

  //判断是否需要更新布局
  @override
  bool shouldRelayout(TestLayoutDelegate oldDelegate) => _needRefresh;
}
      ''';

  @override
  String get title => routeName;
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("下面底、右对齐两个子控件"),
        Container(
          width: 200.0,
          height: 100.0,
          color: Colors.yellow,
          child: CustomMultiChildLayout(
            delegate: _TestLayoutDelegate(),
            children: <Widget>[
              LayoutId(
                id: _TestLayoutDelegate.title,
                child: new Text("This is title",
                    style: TextStyle(fontSize: 20.0, color: Colors.black)),
              ),
              LayoutId(
                id: _TestLayoutDelegate.description,
                child: new Text("This is description",
                    style: TextStyle(fontSize: 14.0, color: Colors.red)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TestLayoutDelegate extends MultiChildLayoutDelegate {
  bool _needRefresh = true;

  static const String title = 'title';
  static const String description = 'description';

  @override
  void performLayout(Size size) {
    //底部、右对齐
    //1. 设置子控件的宽高最大为父控件的宽高
    final BoxConstraints constraints =
        BoxConstraints(maxWidth: size.width, maxHeight: size.height);

    //2. 测量子控件大小，其宽高不能超过约束的宽高
    final Size titleSize = layoutChild(title, constraints);
    final Size descSize = layoutChild(description, constraints);

    //3. 摆放子控件
    //3.1. 先放desc
    positionChild(description,
        new Offset(size.width - descSize.width, size.height - descSize.height));
    //3.2. 再放title
    positionChild(
        title,
        new Offset(size.width - titleSize.width,
            size.height - descSize.height - titleSize.height));
  }

  //判断是否需要更新布局
  @override
  bool shouldRelayout(_TestLayoutDelegate oldDelegate) => _needRefresh;
}
