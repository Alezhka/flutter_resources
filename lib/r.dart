

import 'package:flutter/widgets.dart';

import 'models/configuration.dart';
import 'models/resource.dart';

import 'resolver.dart';
import 'utils.dart';

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
    _instance._init();
    return _instance;
  }

  /// Initialize resources for current configuration.
  Future<void> _init() async {
    _resolved = _resources.map(_resolveDelegate).toList();
  }

  /// Get resource.
  T get<T>(String name) {
    final type = typeOf<T>();
    if(_resolved != null) {
      final ResolveDelegate delegate = _resolved.firstWhere((e) => e.type == type, orElse: () => null);
      return delegate.resources[name];
    }

    final ResourceDelegate<T> delegate = _resources.firstWhere((e) => e.type == type, orElse: () => null);
    if(delegate == null) {
      return null;
    }

    final resource = delegate.resources[name];
    if(resource == null) {
      return null;
    }

    return _resolveResource(resource);
  }

  ResolveDelegate<T> _resolveDelegate<T>(ResourceDelegate<T> delegate) {
    final resources = delegate.resources.map((key, resource) => MapEntry(key, _resolveResource(resource)));
    return ResolveDelegate<T>(delegate.type, resources);
  }

  T _resolveResource<T>(Resource<T> resource) {
    final options = resource.options;
    final value = resource.value;
    final resolved = options.firstWhere((e) => resolve(_configuration, e), orElse: () => null);
    return resolved?.value ?? value;
  }

}
