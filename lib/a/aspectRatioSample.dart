import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AspectRatioSample extends BaseContentApp {
  static const String routeName = 'AspectRatioSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
尝试将子项调整为特定宽高比的widget。

widget首先尝试布局约束允许的最大宽度。widget的高度通过将给定的宽高比应用于宽度来确定，表示为宽度与高度的比率。

举两个例子，在布局约束中宽度和高度的可取范围都是0-100

如果设置宽高比为2的话，那么结果是 widget 的宽度为100，高度为50，因为widget首先尝试布局约束允许的最大宽度，一算刚好满足所有条件。

如果设置宽高比为0.5的话，那么最终的结果是 widget 的宽度为50，高度为100，步骤如下：
1. 首先尝试让宽度等于布局约束允许的最大宽度，发现高度溢出了，
2. 再尝试让高度等于布局允许的最大高度，发现结果满足了所有条件，则得出结论。
3. 如果怎么尝试都无法满足宽高比的话，那么结果将满足布局约束而不满足宽高比，

下面的图二就是第三点的例子

说了这么多，那么来说说什么是布局约束，布局约束指的是AspectRatio 父widget 的宽高约束，而不是AspectRatio子 widget 的。

所以如果你想要让AspectRatio的子 widget 高度为50，宽高为2：1，那么你需要设置AspectRatio的父widget 的高度为50，而不是设置AspectRatio的子 widget 的高度为50.

  ''';

  @override
  String get sampleCode => '''
  Container(
    height: 100.0,//注意设置的是AspectRatio的父Widget
    child: AspectRatio(
      aspectRatio: 2.0,
      child: Container(
        color: Colors.amber,
        child: Center(
          child: Text(''),
        ),
      ),
    ),
  ),
  ''';
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Container(
                height: 50.0,
                child: AspectRatio(
                  aspectRatio: 4.0,
                  child: Container(
                    color: Colors.amber,
                    child: Center(
                      child: Text('设置高度为50，比例为2:1，算出宽度为100，满足第二点。'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          height: 100.0,
          width: 280.0,
          child: AspectRatio(
            aspectRatio: 2.0,
            child: Container(
              color: Colors.amber,
              child: Center(
                child: Text(
                    '手动设置AspectRatio的宽度为280,宽度为100，宽高比为2:1,经过上述的第一第二点无法找到满足比例的宽高，所以最终结果是满足了父widget 的宽高约束，而不满足比例'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
