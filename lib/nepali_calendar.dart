import 'dart:async';

import 'package:flutter/services.dart';

class NepaliCalendar {
  static const MethodChannel _channel =
      const MethodChannel('nepali_calendar');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
