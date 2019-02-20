import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class DragTargetSample extends BaseContentApp {
  static const String routeName = 'DragTargetSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
    让子widget可以拖拽，可以携带data，可以将Draggable拖拽到DragTarget上释放。
    https://medium.com/flutter-community/a-deep-dive-into-draggable-and-dragtarget-in-flutter-487919f6f1e4
  ''';

  @override
  String get sampleCode => '''
  ''';

  @override
  String get title => routeName;
}

class _Sample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SizedBox(
        height: 450,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Draggable(
                data: 5,
                child: Container( //未拖拽之前的widget
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      "5",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                  ),
                  color: Colors.pink,
                ),
                feedback: Container( //拖拽时候的widget
                  width: 100.0,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      "5",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                  ),
                  color: Colors.pink,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.green,
                    child: DragTarget(
                      builder: (context, List<int> candidateData, rejectedData) {
                        print(candidateData);
                        return Center(
                            child: Text(
                              "Even",
                              style: TextStyle(color: Colors.white, fontSize: 22.0),
                            ));
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        if (data % 2 == 0) {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text("Correct!")));
                        } else {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text("Wrong!")));
                        }
                      },
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.deepPurple,
                    child: DragTarget(
                      builder: (context, List<int> candidateData, rejectedData) {
                        return Center(
                            child: Text(
                              "Odd",
                              style: TextStyle(color: Colors.white, fontSize: 22.0),
                            ));
                      },
                      onWillAccept: (data) { //在这里可以判断是否要接受这个draggable
                        return true;
                      },
                      onAccept: (data) {
                        if (data % 2 != 0) {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text("Correct!")));
                        } else {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text("Wrong!")));
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
