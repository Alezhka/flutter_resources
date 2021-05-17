extension IterableEntension<T> on Iterable<T> {

  Iterable<T?> toNullable<T>() {
    return this.cast<T?>();
  }

}
