import '../flutter_resources.dart';

extension IterableEntension<E> on Iterable<E> {

  Iterable<E?> toNullable<E>() {
    return this.cast<E?>();
  }

  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));

  List<E> sorted(Comparator<E> compare) => [...this]..sort(compare);

}

extension IterableResourceDelegate<T> on Iterable<ResourceDelegate<T>> {

  Map<Type, Map<String, T>> merge() {
    return this.groupBy<Type>((r) => r.type)
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