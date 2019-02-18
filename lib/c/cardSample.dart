import 'package:flutter_ui_demo/base.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardSample extends BaseContentApp {
  static const String routeName = 'CardSample';

  @override
  String get title => routeName;

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  自带阴影、圆角效果的 widget
  ''';

  @override
  String get sampleCode => '''
  new Card(
    child: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: const Icon(Icons.album),
          title: const Text('The Enchanted Nightingale'),
          subtitle: const Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
        ),
        new ButtonTheme.bar(
          child: new ButtonBar(
            children: <Widget>[
              new FlatButton(
                child: const Text('BUY TICKETS'),
                onPressed: () {},
              ),
              new FlatButton(
                child: const Text('LISTEN'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ),
  );
  ''';
}

class _Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: const Icon(Icons.album),
            title: const Text('The Enchanted Nightingale'),
            subtitle:
                const Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          new ButtonTheme.bar(
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {},
                ),
                new FlatButton(
                  child: const Text('LISTEN'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
