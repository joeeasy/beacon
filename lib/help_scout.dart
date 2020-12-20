import 'package:flutter/services.dart';

class Beacon {
  Beacon({this.beaconId, this.email = '', this.name = ''});

  final String beaconId;
  final String email;
  final String name;
  static const MethodChannel _channel = const MethodChannel('help_scout');

  Future<void> init() async {
    try {
      await _channel.invokeMethod('setupBeacon', [beaconId, email, name]);
    } on PlatformException catch (e) {
      throw (e.message);
    }
  }

  Future<void> open() async {
    try {
      await _channel.invokeMethod('openBeacon', [beaconId]);
    } on PlatformException catch (e) {
      throw (e.message);
    }
  }
}
