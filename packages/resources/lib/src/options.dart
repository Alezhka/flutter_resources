import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_resources/src/enums.dart';

import 'enums.dart';

class ResourceOption<T> {

  final DisplayMetrics? displayMetrics;
  final ScreenSize? screenSize;
  final Orientation? orientation;
  final String? languageCode;
  final String? countryCode;
  final Brightness? brightness;
  final PlatformType? platform;
  final TextDirection? direction;
  final double? shortestSide;

  const ResourceOption({
    this.displayMetrics,
    this.screenSize,
    this.orientation,
    this.languageCode,
    this.countryCode,
    this.brightness,
    this.platform,
    this.direction,
    this.shortestSide,
  });

}