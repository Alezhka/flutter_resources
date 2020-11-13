
import 'package:flutter/widgets.dart';

import 'models/resource.dart';
import 'r.dart';

class ResourcesData extends InheritedWidget {
  
  final List<ResourceDelegate> delegates;
   
  ResourcesData({
    Key key,
    @required this.delegates,
    @required Widget child,
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
    @override List<ResourceDelegate> delegates,
    Widget child,
    Key key,
  }) :
    _child = child,
    _delegates = delegates,
    super(key: key);

  @override
  _ResourceState createState() => _ResourceState();

  static R of(BuildContext context) {
    final data = context.dependOnInheritedWidgetOfExactType<ResourcesData>();
    if(data == null) {
      return null;
    }

    return R.of(context, data.delegates);
  }

  static void init(BuildContext context) {
    final r = of(context);
    r.init();
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
