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
  String _platformVersion = 'Unknown';
  Beacon _beacon;

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    _beacon = Beacon(
        beaconId: "87dc2180-03e2-4f4c-bb9f-f392829958b5",
        email: "jehonabokpus@gmail.com",
        name: "Joe Okpus");
    setState(() {});
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _beacon.init();
    } on PlatformException catch (e) {
      debugPrint('${e.message}');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
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
