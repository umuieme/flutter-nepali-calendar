import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nepali_calendar/nepali_calendar.dart';

void main() {
  const MethodChannel channel = MethodChannel('nepali_calendar');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await NepaliCalendar.platformVersion, '42');
  });
}
