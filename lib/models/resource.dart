import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_resources/models/enums.dart';

import 'enums.dart';

abstract class ResourceDelegate<T> {

  Type get type => T;

  Map<String, Resource<T>> get resources;

}

class ResolveDelegate<T> {

  final Type type;
  final Map<String, T> resources;

  const ResolveDelegate(this.type, this.resources);

}

class Resource<T> {

  final T value;
  final List<ResourceOption<T>> options;

  const Resource(this.value, this.options);

}

class ResourceOption<T> {

  final T value;
  final DisplayMetrics? displayMetrics;
  final ScreenSize? screenSize;
  final Orientation? orientation;
  final String? languageCode;
  final String? countryCode;
  final Brightness? brightness;
  final PlatformType? platform;
  final TextDirection? direction;

  const ResourceOption(this.value, {
    this.displayMetrics,
    this.screenSize,
    this.orientation,
    this.languageCode,
    this.countryCode,
    this.brightness,
    this.platform,
    this.direction,
  });
}