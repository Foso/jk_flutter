import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/LoginWidget.dart';
import '../networkview.dart';
import '../platform_specific/BatterieLevel.dart';
import '../search/SearchExample.dart';
import 'MainDrawer.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Example App")),
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
          RaisedButton(
            child: Text('Login'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginWidget()),
              );
            },
          ),
          RaisedButton(
            child: Text('BatterieLevel'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BatterieLevel()),
              );
            },
          ),
        ],
      ),
      drawer: MainDrawer(context),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
      ),
    );
  }
}
