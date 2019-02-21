import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/base.dart';

// ignore: must_be_immutable
class EditableTextSample extends BaseContentApp {
  static const String routeName = 'EditableTextSample';

  @override
  Widget get contentWidget => _Sample();

  @override
  String get desc => '''
  EditableText 文本输入框，比较基础，可以监听输入相应事件，一般推荐使用TextField，后者功能丰富、MD设计并且携带placeHolder
  ''';

  @override
  String get sampleCode => '''
  EditableText(
      controller: _controller,
      focusNode: FocusNode(),
      style: DefaultTextStyle.of(context).style,
      cursorColor: Colors.cyan,
      backgroundCursorColor: Colors.black,
      textInputAction: TextInputAction.go,
      onEditingComplete: () {
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (c) {
              return Align(
                  alignment: Alignment(0, 0),
                  child: Text(
                    "点击了键盘的完成按钮",
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 12),
                  ));
            });
      },
    );
  ''';

  @override
  String get title => routeName;
}

class _Sample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "default");
  }

  @override
  Widget build(BuildContext context) {
    return EditableText(
      controller: _controller,
      focusNode: FocusNode(),
      style: DefaultTextStyle.of(context).style,
      cursorColor: Colors.cyan,
      backgroundCursorColor: Colors.black,
      textInputAction: TextInputAction.go,
      onEditingComplete: () {
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (c) {
              return Align(
                  alignment: Alignment(0, 0),
                  child: Text(
                    "点击了键盘的完成按钮",
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 12),
                  ));
            });
      },
    );
  }
}
