
import 'package:flutter/cupertino.dart';
import 'package:flutter_resources/flutter_resources.dart';
import 'package:flutter_resources/src/constants.dart';
import 'package:flutter_resources/src/configuration.dart';
import 'package:flutter_resources/src/options.dart';

bool resolve(Configuration c, ResourceOption? o) {
  if(o == null) {
    return true;
  }

  if(o.displayMetrics != null && !_resolveDisplayMetrics(c, o.displayMetrics)) {
    return false;
  }

  if(o.screenSize != null && !_resolveScreenSize(c, o.screenSize)) {
    return false;
  }

  if(o.orientation != null && !_resolveOrientation(c, o.orientation)) {
    return false;
  }

  if(o.orientation != null && !_resolveOrientation(c, o.orientation)) {
    return false;
  }

  if(o.languageCode != null && !_resolveLanguageCode(c, o.languageCode)) {
    return false;
  }

  if(o.countryCode != null && !_resolveCountryCode(c, o.countryCode)) {
    return false;
  }

  if(o.brightness != null && !_resolveBrightness(c, o.brightness)) {
    return false;
  }

  if(o.platform != null && !_resolvePlatform(c, o.platform)) {
    return false;
  }

  if(o.direction != null && !_resolveDirection(c, o.direction)) {
    return false;
  }

  if(o.shortestSide != null && !_resolveShortestSide(c, o.shortestSide)) {
    return false;
  }

  return true;
}

bool _resolveDisplayMetrics(Configuration c, DisplayMetrics? value) {
  final ratio = c.pixelRatio;
  switch(value) {
    case DisplayMetrics.l:
      return ratio <= kRatioLdpi; 
    case DisplayMetrics.m:
      return ratio > kRatioLdpi && ratio <= kRatioMdpi;
    case DisplayMetrics.h:
      return ratio > kRatioMdpi && ratio <= kRatioHdpi;
    case DisplayMetrics.xh:
      return ratio > kRatioHdpi && ratio <= kRatioXHdpi;
    case DisplayMetrics.xxh:
      return ratio > kRatioXHdpi && ratio <= kRatioXXHdpi;
    case DisplayMetrics.xxxh:
      return ratio > kRatioXXHdpi;
    case null:
      return false;
  }
}

bool _resolveScreenSize(Configuration c, ScreenSize? value) {
  final height = c.size.height;
 
  switch(value) {
    case ScreenSize.small:    // 320x426
      return height <= 426; 
    case ScreenSize.normal:   // 320x470
      return height > 426 && height <= 470;
    case ScreenSize.large:    // 480x640
      return height > 470 && height <= 640;
    case ScreenSize.xlarge:   // 720x960 
      return height > 640;
    case null:
      return false;
  }
}

bool _resolveOrientation(Configuration c, Orientation? value) {
  return value == c.orientation;
}

bool _resolveLanguageCode(Configuration c, String? value) {
  return value == c.languageCode;
}

bool _resolveCountryCode(Configuration c, String? value) {
  return value == c.countryCode;
}

bool _resolveBrightness(Configuration c, Brightness? value) {
  return value == c.brightness;
}

bool _resolvePlatform(Configuration c, PlatformType? value) {
  return value == c.platform;
}


bool _resolveDirection(Configuration c, TextDirection? value) {
  return value == c.direction;
}

bool _resolveShortestSide(Configuration c, double? value) {
  return (value ?? -1) >= c.size.shortestSide;
}