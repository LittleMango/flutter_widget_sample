import 'package:flutter/material.dart';
import 'lib.dart';
// ignore: must_be_immutable
class Home extends StatelessWidget {

  List<String> items = getSamples();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter UI Sample'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, position) {
            return _buildItems(context, position);
          },
        ),
    );
  }

  Widget _buildItems(BuildContext context, int position) {
    String routeName = items[position];

    return Column(
      children: <Widget>[
        ListTile(
          title: Text(routeName),
          onTap:  () {
            Navigator.pushNamed(context, routeName);
          },
        ),
        Divider(),
      ],
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
  list.add(AnimatedThemeSample.routeName);
  list.add(AppBarSample.routeName);
  list.add(AspectRatioSample.routeName);
  list.add(AssetImageSample.routeName);

  list.add(BackButtonSample.routeName);
  list.add(BackButtonIconSample.routeName);
  list.add(BackdropFilterSample.routeName);
  list.add(BannerSample.routeName);
  list.add(BaselineSample.routeName);
  list.add(BeveledRectangleBorderSample.routeName);
  list.add(BorderSample.routeName);
  list.add(BorderDirectionalSample.routeName);
  list.add(BorderRadiusSample.routeName);
  list.add(BorderRadiusDirectionalSample.routeName);
  list.add(BorderRadiusTweenSample.routeName);
  list.add(BorderSideSample.routeName);
  list.add(BottomAppBarSample.routeName);
  list.add(BottomNavigationBarSample.routeName);
  list.add(BottomSheetSample.routeName);
  list.add(BouncingScrollPhysicsSample.routeName);
  list.add(BoxConstraintsSample.routeName);
  list.add(BoxConstraintsTweenSample.routeName);
  list.add(BoxDecorationSample.routeName);
  list.add(ButtonBarSample.routeName);
  list.add(ButtonThemeSample.routeName);
  list.add(CardSample.routeName);
  list.add(CenterSample.routeName);
  list.add(CheckboxSample.routeName);
  list.add(CheckboxListTileSample.routeName);
  list.add(CheckedModeBannerSample.routeName);
  list.add(CheckedPopupMenuItemSample.routeName);
  list.add(ChipSample.routeName);
  list.add(ChipThemeSample.routeName);
  list.add(ChoiceChipSample.routeName);
  list.add(CircleAvatarSample.routeName);
  list.add(CircleBorderSample.routeName);
  list.add(CircularProgressIndicatorSample.routeName);
  list.add(ClampingScrollPhysicsSample.routeName);
  list.add(ClipOvalSample.routeName);
  list.add(ClipPathSample.routeName);
  list.add(ClipRectSample.routeName);
  list.add(ClipRRectSample.routeName);
  list.add(CloseButtonSample.routeName);
  list.add(ColorTweenSample.routeName);

  return list;
}