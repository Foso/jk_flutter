import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ui/navigation/FirstRoute.dart';

class NavigationApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstRoute(),
    );
  }
}
