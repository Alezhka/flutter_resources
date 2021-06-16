
import 'package:flutter/widgets.dart';

import 'resource.dart';
import 'r.dart';

class ResourcesData extends InheritedWidget {
  
  final List<ResourceDelegate> delegates;
   
  ResourcesData({
    Key? key,
    required this.delegates,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant ResourcesData oldWidget) {
    return false;
  }

}

class Resources extends StatefulWidget {

  final List<ResourceDelegate> _delegates;
  final Widget _child;

  Resources({
    required List<ResourceDelegate> delegates,
    required Widget child,
    Key? key,
  }) :
    _child = child,
    _delegates = delegates,
    super(key: key);

  @override
  _ResourceState createState() => _ResourceState();

  static R of(BuildContext context) {
    final data = context.dependOnInheritedWidgetOfExactType<ResourcesData>();
    if(data == null) {
      throw Exception('Failed to depend on top widget. Please put ResourcesData widget on top.');
    }

    return R.of(context, data.delegates);
  }

}

class _ResourceState extends State<Resources> {
  
  @override
  Widget build(BuildContext context) {
    return ResourcesData(
      delegates: widget._delegates,
      child: widget._child,
    );
  }

}
