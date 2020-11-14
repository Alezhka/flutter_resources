
import 'package:flutter/cupertino.dart';
import 'package:flutter_resources/flutter_resources.dart';
import 'package:flutter_resources/models/configuration.dart';

import 'package:flutter_resources/models/resource.dart';

bool resolve(Configuration c, ResourceOption o) {
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

  return true;
}

bool _resolveDisplayMetrics(Configuration c, DisplayMetrics value) {
  final width = c.size.width;
 
  switch(value) {
    case DisplayMetrics.l:    // 120dpi
      return width <= 120; 
    case DisplayMetrics.m:    // 160dpi
      return width > 120 && width <= 160;
    case DisplayMetrics.h:    // 240dpi
      return width > 160 && width <= 240;
    case DisplayMetrics.xh:   // 320dpi
      return width > 240 && width <= 320;
    case DisplayMetrics.xxh:  // 480dpi 
      return width > 320 && width <= 480;
    case DisplayMetrics.xxxh: // 720dpi 
      return width > 480 && width <= 720;
  }
  return false;
}

bool _resolveScreenSize(Configuration c, ScreenSize value) {
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
  }
  return false;
}

bool _resolveOrientation(Configuration c, Orientation value) {
  return value == c.orientation;
}

bool _resolveLanguageCode(Configuration c, String value) {
  return value == c.languageCode;
}

bool _resolveCountryCode(Configuration c, String value) {
  return value == c.countryCode;
}

bool _resolveBrightness(Configuration c, Brightness value) {
  return value == c.brightness;
}

bool _resolvePlatform(Configuration c, PlatformType value) {
  return value == c.platform;
}