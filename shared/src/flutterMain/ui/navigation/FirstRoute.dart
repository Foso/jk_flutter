import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../networkview.dart';
import '../search/ExamplePage.dart';
import 'SecondRoute.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('Open fetch network data example'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NetworkView()),
              );
            },
          ),
          RaisedButton(
            child: Text('Open route2'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchExample()),
              );
            },
          ),
        ],
      ),
    );
  }
}
