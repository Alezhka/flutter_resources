import 'package:flutter_resources/src/options.dart';

abstract class ResourceDelegate<T> {

  Type get type => T;

  ResourceOption? get options;

  Map<String, T> get values;

}
