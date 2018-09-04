import 'package:flutter/material.dart';
import 'lib.dart';
class Home extends StatelessWidget {

  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter UI Sample'),
        ),
        body: ListView(
          children: _buildItems(),
        ),
      ),
    );
  }

  List<Widget> _buildItems() {
    List<Widget> list = List();
    for (String name in getSamples()) {
      list.add(_buildItem(name, name));
      list.add(Divider());
    }
    return list;
  }

  Widget _buildItem(String content, String routeName) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(content),
      ),
      onTap: () {
        Navigator.pushNamed(_context, routeName);
      },
    );
  }
}

List<String> getSamples() {
  List<String> list = List();
  list.add(AboutDialogSample.routeName);
  list.add(ActionChipSample.routeName);
  list.add(AlertDialogSample.routeName);
  list.add(AlignSample.routeName);
  list.add(AlignmentSample.routeName);
  list.add(AlignTransitionSample.routeName);
  list.add(AnimationSample.routeName);
  list.add(AnimatedAlignSample.routeName);
  list.add(AnimatedWidgetSample.routeName);
  list.add(AnimatedBuilderSample.routeName);
  list.add(AnimatedContainerSample.routeName);
  list.add(AnimatedCrossFadeSample.routeName);
  list.add(AnimatedDefaultTextStyleSample.routeName);
  list.add(AnimatedIconSample.routeName);
  list.add(AnimatedListSample.routeName);
  list.add(AnimatedModalBarrierSample.routeName);
  list.add(AnimatedOpacitySample.routeName);
  list.add(AnimatedPaddingSample.routeName);
  list.add(AnimatedPhysicalModelSample.routeName);
  list.add(AnimatedPositionedSample.routeName);
  list.add(AnimatedPositionedDirectionalSample.routeName);
  list.add(AnimatedSizeSample.routeName);
  list.add(AnimatedSwitcherSample.routeName);
  list.add(AnimationControllerSample.routeName);

  return list;
}