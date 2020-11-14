
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils.dart';
import 'enums.dart';

class Configuration {

  final Size size;
  final Orientation orientation;
  final String languageCode;
  final String countryCode;
  final Brightness brightness;
  final PlatformType platform;

  Configuration({
    this.size,
    this.orientation,
    this.languageCode,
    this.countryCode,
    this.brightness,
    this.platform,
  });

  factory Configuration.of(BuildContext context) {
    final mq = MediaQuery.of(context);
    final locale = Localizations.localeOf(context);
    return Configuration(
      size: mq.size,
      orientation: mq.orientation,
      languageCode: locale.languageCode,
      countryCode: locale.countryCode,
      brightness: mq.platformBrightness,
      platform: currentPlatform,
    );
  }

  @override
  bool operator==(other) {
    if(other is! Configuration) {
      return false;
    }
    // ignore: test_types_in_equals
    final o = other as Configuration;
    return size == o.size
        && orientation == o.orientation
        && languageCode == o.languageCode
        && countryCode == o.countryCode
        && brightness == o.brightness
        && platform == o.platform;
  }

  @override
  int get hashCode => size.hashCode 
      ^ orientation.hashCode 
      ^ languageCode.hashCode 
      ^ countryCode.hashCode 
      ^ brightness.hashCode
      ^ platform.hashCode;

  
}