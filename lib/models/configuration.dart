
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils.dart';
import 'enums.dart';

class Configuration {

  final Size size;
  final double pixelRatio;
  final Orientation orientation;
  final String languageCode;
  final String? countryCode;
  final Brightness brightness;
  final PlatformType platform;
  final TextDirection direction;

  Configuration({
    required this.size,
    required this.pixelRatio,
    required this.orientation,
    required this.languageCode,
    required this.countryCode,
    required this.brightness,
    required this.platform,
    required this.direction,
  });

  factory Configuration.of(BuildContext context) {
    final mq = MediaQuery.of(context);
    final locale = Localizations.localeOf(context);
    final direction = Directionality.of(context);
    return Configuration(
      size: mq.size,
      pixelRatio: mq.devicePixelRatio,
      orientation: mq.orientation,
      languageCode: locale.languageCode,
      countryCode: locale.countryCode,
      brightness: mq.platformBrightness,
      platform: currentPlatform,
      direction: direction,
    );
  }

  @override
  bool operator==(other) {
    if(other is! Configuration) {
      return false;
    }
    // ignore: test_types_in_equals
    return size == other.size
        && orientation == other.orientation
        && languageCode == other.languageCode
        && countryCode == other.countryCode
        && brightness == other.brightness
        && platform == other.platform
        && direction == other.direction;
  }

  @override
  int get hashCode => size.hashCode 
      ^ orientation.hashCode 
      ^ languageCode.hashCode 
      ^ countryCode.hashCode 
      ^ brightness.hashCode
      ^ platform.hashCode
      ^ direction.hashCode;

  
}