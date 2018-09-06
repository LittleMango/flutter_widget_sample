import 'package:flutter/material.dart';

class BottomAppBarSample extends StatelessWidget {

  static const String routeName = 'BottomAppBarSample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(routeName),
        ),
        body: Center(
          child: Text('通常与Scaffold.bottomNavigationBar一起使用的容器'),
        ),
        bottomNavigationBar: new BottomAppBar(
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(icon: Icon(Icons.build), onPressed: (){}, color: Colors.white,),
              IconButton(icon: Icon(Icons.star), onPressed: (){}, color: Colors.white),
              IconButton(icon: Icon(Icons.satellite), onPressed: (){}, color: Colors.white),
              IconButton(icon: Icon(Icons.radio), onPressed: (){}, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

}