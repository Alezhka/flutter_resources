
/// Resource provider.
abstract class ResourceProvider<T> {

  Type get type => T;

  Future<Map<String,T>> provide();

}