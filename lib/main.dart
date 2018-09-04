import 'package:flutter/material.dart';
import 'lib.dart';
import 'home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => new Home(),
        AboutDialogSample.routeName : (BuildContext context) => new AboutDialogSample(),
        ActionChipSample.routeName : (BuildContext context) => new ActionChipSample(),
        AlertDialogSample.routeName : (BuildContext context) => new AlertDialogSample(),
        AlignSample.routeName : (BuildContext context) => new AlignSample(),
        AlignmentSample.routeName : (BuildContext context) => new AlignmentSample(),
        AlignTransitionSample.routeName : (BuildContext context) => new AlignTransitionSample(),
        AnimationSample.routeName : (BuildContext context) => new AnimationSample(),
        AnimatedAlignSample.routeName : (BuildContext context) => new AnimatedAlignSample(),
        AnimatedWidgetSample.routeName : (BuildContext context) => new AnimatedWidgetSample(),
        AnimatedBuilderSample.routeName : (BuildContext context) => new AnimatedBuilderSample(),
        AnimatedContainerSample.routeName : (BuildContext context) => new AnimatedContainerSample(),
        AnimatedCrossFadeSample.routeName : (BuildContext context) => new AnimatedCrossFadeSample(),
        AnimatedDefaultTextStyleSample.routeName : (BuildContext context) => new AnimatedDefaultTextStyleSample(),
        AnimatedIconSample.routeName : (BuildContext context) => new AnimatedIconSample(),
        AnimatedListSample.routeName : (BuildContext context) => new AnimatedListSample(),
        AnimatedModalBarrierSample.routeName : (BuildContext context) => new AnimatedModalBarrierSample(),
        AnimatedOpacitySample.routeName : (BuildContext context) => new AnimatedOpacitySample(),
        AnimatedPaddingSample.routeName : (BuildContext context) => new AnimatedPaddingSample(),
        AnimatedPhysicalModelSample.routeName : (BuildContext context) => new AnimatedPhysicalModelSample(),
        AnimatedPositionedSample.routeName : (BuildContext context) => new AnimatedPositionedSample(),
        AnimatedPositionedDirectionalSample.routeName : (BuildContext context) => new AnimatedPositionedDirectionalSample(),
        AnimatedSizeSample.routeName : (BuildContext context) => new AnimatedSizeSample(),
        AnimatedSwitcherSample.routeName : (BuildContext context) => new AnimatedSwitcherSample(),

      },
    );
  }
}
