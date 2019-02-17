import 'package:flutter/material.dart';

import '../search/SearchExample.dart';

class MainDrawer extends Drawer {
  BuildContext outContext;

  MainDrawer(BuildContext context) {
    outContext = context;
  }

  @override
  // TODO: implement child
  Widget get child => ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Search'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                outContext,
                MaterialPageRoute(builder: (context) => SearchExample()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Profile'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                outContext,
                MaterialPageRoute(builder: (context) => SearchExample()),
              );
            },
          ),
        ],
      );
}
