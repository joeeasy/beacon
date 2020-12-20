import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:help_scout/help_scout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Beacon _beacon;

  @override
  void initState() {
    super.initState();

    initBeacon();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initBeacon() async {
    _beacon = Beacon(
        beaconId: "XXX-XXX-XXX-XXXX-XXX",
        email: "example@gmail.com",
        name: "John Doe");
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _beacon.init();
    } on PlatformException catch (e) {
      debugPrint('${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Launch beacon'),
            onPressed: () {
              _beacon.open();
            },
          ),
        ),
      ),
    );
  }
}
