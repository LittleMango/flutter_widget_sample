import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class DismissibleSample extends BaseContentApp {
  static const String routeName = 'DismissibleSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  用来做滑动删除，可以指定滑动方向(横、竖、上下左右)，删除后有回调，可以设置删除后的背景widget
  ''';

  @override
  String get sampleCode => '''
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            direction: DismissDirection.endToStart,
            key: Key(item),//必须有key，作为唯一标志
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });

              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("\$item dismissed")));
            },
            background: Container(color: Colors.red),
            child: ListTile(title: Text('\$item')),
          );
        },
      )
  ''';

  @override
  String get title => routeName;
}

class _Sample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  final items = List<String>.generate(10, (i) => "滑动删除 + $i");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.cyan,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            direction: DismissDirection.endToStart,
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: Key(item),
            // We also need to provide a function that tells our app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from our data source.
              setState(() {
                items.removeAt(index);
              });

              // Then show a snackbar!
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("$item dismissed")));
            },
            // Show a red background as the item is swiped away
            background: Container(color: Colors.red),
            child: ListTile(title: Text('$item')),
          );
        },
      ),
    );
  }
}
