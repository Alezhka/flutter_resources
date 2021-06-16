
import 'dart:convert';

import 'package:flutter_resources/src/providers/resource_provider.dart';

// Json provider. 
class JsonProvider<T> extends ResourceProvider<T> {

  final String jsonString;

  JsonProvider(this.jsonString);
  
  @override
  Future<Map<String, T>> provide() async {
    final result = jsonDecode(jsonString);
    if(result !is Map) {
      throw Exception('JSON string must be map to root object!');
    }

    final safety = Map<String, dynamic>.of(result)
      ..removeWhere((key, value) => value.runtimeType != type);
    return safety.cast<String, T>();
  }

}