import 'package:flutter_resources/src/providers/resource_provider.dart';

// Json provider. 
class MapProvider<T> extends ResourceProvider<T> {

  final Map<String, T> data;

  MapProvider(this.data);
  
  @override
  Future<Map<String, T>> provide() async {
    final safety = data
      ..removeWhere((key, value) => value.runtimeType != type);
    return safety.cast<String, T>();
  }

}