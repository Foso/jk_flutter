import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventChannelSamplePage extends StatefulWidget {
  EventChannelSamplePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EventChannelSamplePageState createState() =>
      new _EventChannelSamplePageState();
}

class _EventChannelSamplePageState extends State<EventChannelSamplePage> {
  static const stream =
      const EventChannel('com.yourcompany.eventchannelsample/stream');

  int _timer = 0;
  StreamSubscription _timerSubscription = null;

  void _enableTimer() {
    if (_timerSubscription == null) {
      _timerSubscription = stream.receiveBroadcastStream().listen(_updateTimer);
    }
  }

  void _disableTimer() {
    if (_timerSubscription != null) {
      _timerSubscription.cancel();
      _timerSubscription = null;
    }
  }

  void _updateTimer(timer) {
    debugPrint("Timer $timer");
    setState(() => _timer = timer);
  }

  @override
  Widget build(BuildContext context) {
    var timerCard = new Card(
        child: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      const ListTile(
        leading: const Icon(Icons.timer),
        title: const Text('Event and Method Channel Sample'),
        subtitle: const Text(
            'An example application showing off the communications between Flutter and native Android.'),
      ),
      new Center(
        child: new Text(
          '$_timer',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
      new ButtonTheme.bar(
          child: new ButtonBar(children: <Widget>[
        new FlatButton(
          child: const Text('Enable'),
          onPressed: _enableTimer,
        ),
        new FlatButton(
          child: const Text('Disable'),
          onPressed: _disableTimer,
        ),
      ]))
    ]));

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Container(
          padding: new EdgeInsets.all(8.0),
          child: timerCard,
        ));
  }
}
