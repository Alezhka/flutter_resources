import "package:collection/collection.dart";

import '../flutter_resources.dart';

extension IterableEntension<T> on Iterable<T> {

  Iterable<T?> toNullable<T>() {
    return this.cast<T?>();
  }

}

extension IterableResourceDelegate<T> on Iterable<ResourceDelegate<T>> {

  Map<Type, Map<String, T>> merge() {
    return groupBy<ResourceDelegate, Type>(this, (r) => r.type)
      .map((key, value) {
        final merged = value
          .sorted((a, b) {
            if (a.options == null && b.options == null) return 0;
            if (a.options == null) return -1;
            if (b.options == null) return 1;
            return 0;
          })
          .map((e) => e.values)
          .reduce((value, element) => value..addAll(element))
          .cast<String, T>();
        return MapEntry(key, merged);
      });
  }

}