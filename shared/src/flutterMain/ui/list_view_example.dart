import 'package:flutter/material.dart';
import '../utils/MethodChannelHelper.dart';

class ListViewExample extends StatefulWidget {
  ListViewExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListViewExampleState createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ddd"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Album'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
        ],
      ),
    );
  }
}
