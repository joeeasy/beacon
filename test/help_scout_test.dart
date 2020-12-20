import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:help_scout/help_scout.dart';

void main() {
  const MethodChannel channel = MethodChannel('help_scout');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Beacon.platformVersion, '42');
  });
}
