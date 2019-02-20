import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class CustomSingleChildLayoutSample extends BaseContentApp {
  static const String routeName = 'CustomSingleChildLayoutSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  CustomMultiChildLayout可以通过delegate控制子widget的尺寸和位置，和CustomMultiChildLayout类似，不过前者只能有一个子widget
  ''';

  @override
  String get sampleCode => '''
class _CustomSingleChildDelegate extends SingleChildLayoutDelegate {
  //控制尺寸
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    Size size = getSize(constraints);
    return BoxConstraints.tight(Size(size.width / 2, size.height / 2));
  }

  //控制位置
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset((size.width - childSize.width) / 2,
        (size.height - childSize.height) / 2);
  }

  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    return false;
  }
}
      ''';

  @override
  String get title => routeName;
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        color: Colors.green,
        child: CustomSingleChildLayout(
          delegate: _CustomSingleChildDelegate(),
          child: Container(
            color: Colors.amber,
            child: Center(child: Text("我是居中对齐，宽度宽度为父控件一半的文本")),
          ),
        ));
  }
}

class _CustomSingleChildDelegate extends SingleChildLayoutDelegate {
  //控制尺寸
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    Size size = getSize(constraints);
    return BoxConstraints.tight(Size(size.width / 2, size.height / 2));
  }

  //控制位置
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset((size.width - childSize.width) / 2,
        (size.height - childSize.height) / 2);
  }

  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    return false;
  }
}
