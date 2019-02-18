import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaselineSample extends BaseContentApp {
  static const String routeName = 'BaselineSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  baseline是一个widget，用来设置子widget的基线位置，如果子widget没有基线，则默认底部为基线。
  作用用来美化一组排列的widget，让其看上去更加顺眼。。。
  
  正如下面的三个Text，它们存放在一个Row容器中，让设置crossAxisAlignment: CrossAxisAlignment.center时，
  Text会以baseline为准线进行对齐。
  
  我们修改了第一和第三个widget的baseline，都等于70，那么可以看到第一和第三个的top和botoom是同一水平线的。
  
  ''';

  @override
  String get sampleCode => '''
  Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Baseline(
            baseline: 70.0,
            baselineType: TextBaseline.alphabetic,
            child: Text('jKf',
                style: Theme.of(context).textTheme.display2,
            ),
          ),
          Text('jKf',
              style: Theme.of(context).textTheme.display2),
          Baseline(
            baseline: 70.0,
            baselineType: TextBaseline.alphabetic,
            child: Text('jKf',
              style: Theme.of(context).textTheme.display2,
            ),
          ),
        ],
      ),
    ],
  );
  ''';
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Baseline(
              baseline: 70.0,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                'jKf',
                style: Theme.of(context).textTheme.display2,
              ),
            ),
            Text('jKf', style: Theme.of(context).textTheme.display2),
            Baseline(
              baseline: 70.0,
              baselineType: TextBaseline.alphabetic,
              child: Text(
                'jKf',
                style: Theme.of(context).textTheme.display2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
