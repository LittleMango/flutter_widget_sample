import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class AnimatedIconSample extends BaseContentApp {
  static const String routeName = 'AnimatedIconSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
在给定的动画进度中显示动画图标。

可用图标在AnimatedIcons中指定。

可以将AnimatedIcons中的图标看成是一张 gif，

然后给其设置一个 AnimationController，可以控制动画的时间和插值器。

常和AnimatedIcons配套使用，或者自己实例化AnimatedIconData抽象类，定制自己的矢量动画图标
  ''';

  @override
  String get sampleCode => '''
  controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();
      
  new AnimatedIcon(
    icon: AnimatedIcons.menu_arrow,
    progress: controller,
  );
  ''';
}

class _Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        new AnimatedIcon(
          icon: AnimatedIcons.add_event,
          progress: controller,
        ),
        new AnimatedIcon(
          icon: AnimatedIcons.arrow_menu,
          progress: controller,
        ),
        new AnimatedIcon(
          icon: AnimatedIcons.close_menu,
          progress: controller,
        ),
        new AnimatedIcon(
          icon: AnimatedIcons.ellipsis_search,
          progress: controller,
        ),
        new AnimatedIcon(
          icon: AnimatedIcons.event_add,
          progress: controller,
        ),
        new AnimatedIcon(
          icon: AnimatedIcons.home_menu,
          progress: controller,
        ),
        new AnimatedIcon(
          icon: AnimatedIcons.list_view,
          progress: controller,
        ),
        new AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: controller,
        ),
        new AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: controller,
        ),
        new AnimatedIcon(
          icon: AnimatedIcons.menu_home,
          progress: controller,
        ),
        new AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: controller,
        ),
        new AnimatedIcon(
          icon: AnimatedIcons.search_ellipsis,
          progress: controller,
        ),
        new AnimatedIcon(
          icon: AnimatedIcons.view_list,
          progress: controller,
        ),
      ],
    );
  }
}
