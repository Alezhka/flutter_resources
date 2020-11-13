

import 'package:flutter/widgets.dart';

import 'models/configuration.dart';
import 'models/resource.dart';

import 'resolver.dart';

class R {

  static R _instance;

  final Configuration _configuration;
  final List<ResourceDelegate> _resources;
  List<ResolveDelegate> _resolved;

  R._(this._configuration, this._resources);

  static R of(BuildContext context, List<ResourceDelegate> resources) {
    final newConfiguration = Configuration.of(context);
    if(newConfiguration == _instance?._configuration) {
      return _instance;
    }

    _instance = R._(newConfiguration, resources);
    return _instance;
  }

  /// Initialize resources for current configuration.
  void init() async {
    _resolved = _resources.map((d) {
      final resources = d.resources.map((key, resource) => MapEntry(key, _resolveResource(resource)));
      return ResolveDelegate(resources);
    }).toList();
  }

  /// Get resource.
  T get<T>(String name) {
    if(_resolved != null) {
      final ResolveDelegate<T> delegate = _resolved.firstWhere((e) => e is T, orElse: () => null);
      return delegate.resources[name];
    }

    final ResourceDelegate<T> delegate = _resources.firstWhere((e) => e is T, orElse: () => null);
    if(delegate == null) {
      return null;
    }

    final resource = delegate.resources[name];
    if(resource == null) {
      return null;
    }

    return _resolveResource(resource);
  }

  T _resolveResource<T>(Resource<T> resource) {
    final options = resource.options;
    final value = resource.value;
    final resolved = options.firstWhere((e) => resolve(_configuration, e), orElse: () => null);
    return resolved?.value ?? value;
  }

}
