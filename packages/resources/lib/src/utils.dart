
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'enums.dart';

Type typeOf<X>() => X;

PlatformType get currentPlatform {
  if(kIsWeb) return PlatformType.web;
  if(Platform.isWindows) return PlatformType.windows;
  if(Platform.isFuchsia) return PlatformType.fuchsia;
  if(Platform.isMacOS) return PlatformType.macOS;
  if(Platform.isLinux) return PlatformType.linux;
  if(Platform.isIOS) return PlatformType.ios;
  return PlatformType.android;
}