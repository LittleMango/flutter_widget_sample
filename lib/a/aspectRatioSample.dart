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

这里有个例子：
在 listView 中，每个 item 默认都是宽度填充满屏幕的，如果 item 是一个 Container，Container 对于宽高约束是这样的：
如果如果父容器的约束是有边界的，那么 container 会呈现最大化去满足它，在这里 Container的宽度就是屏幕宽度，


所以计算的时候是优先满足宽度，再考虑高度。
  ''';

  @override
  String get sampleCode => '';
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
                      child: Text('满足高度=50，宽度 = 高度 * 4的情况'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        AspectRatio(
            aspectRatio: 2.0,
          child: Container(
            height: 20.0,
            color: Colors.amber,
            child: Center(
              child: Text('Container 的行为很奇怪，首先它在宽度上会尽可能地大，因为外界 widget 的宽度是有边界的，然后设置宽高比为2：1，高度约束为20，结果子 widget 直接用宽度和宽高比计算出高度，并且覆盖了我们所设置的高度约束，这个不符合文档说明。'),
            ),
          ),
        ),
      ],
    );
  }
}
