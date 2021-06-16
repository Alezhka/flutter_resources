

import 'package:flutter/widgets.dart';

import 'configuration.dart';
import 'resource.dart';

import 'resolver.dart';
import 'utils.dart';
import 'extensions.dart';

class R {

  static R? _instance;

  final Configuration _configuration;
  final List<ResourceDelegate> _resources;
  late Map<Type, Map<String, dynamic>>? _resolved;

  R._(this._configuration, this._resources);

  static R of(BuildContext context, List<ResourceDelegate> resources) {
    final newConfiguration = Configuration.of(context);
    if(newConfiguration == _instance?._configuration) {
      return _instance!;
    }

    _instance = R._(newConfiguration, resources)
      .._init();
    return _instance!;
  }

  /// Initialize resources for current configuration.
  Future<void> _init() async {
    _resolved = _resources
      .where((e) => resolve(_configuration, e.options))
      .merge();
  }

  /// Get resource.
  T? get<T>(String name) {
    final type = typeOf<T>();
    if(_resolved == null) {
      _init();
    }

    return _resolved?[type]?[name];
  }

}
