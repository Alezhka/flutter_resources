# flutter_resources

Flutter resources management plugin for improve your application responsibility.

## Getting Started

1. Import library.
```
import 'package:flutter_resources/flutter_resources.dart';
```

2. Create resource delegates. For example:
```
class IntResources extends ResourceDelegate<int> {

  @override
  ResourceOption? get options => null;
  
  @override
  Map<String, Resource<int>> get resources => {
    'some_size': 15,
  };

}
class IntTabletResources extends ResourceDelegate<int> {

  @override
  ResourceOption? get options => ResourceOption(5,
    shortestSide: 700,
  );
  
  @override
  Map<String, Resource<int>> get resources => {
    'some_size': 70,
  };

}
``` 

If no one options not conditions will be returned default value fron null options.

3. Put Resources widget before App widget.
```
Resources( 
    delegates: [
        IntResources(),
        IntTabletResources(),
        ... // Other resource delegates.
    ],
    child: MaterialApp(), 
)
```

4. Get data.
```
final resources = Resources.of(context);
final size = resources.get<int>('some_size');

```

## Support options

* displayMetrics (l, m, h, xh, xxh, xxxh);
* screenSize (small, normal, large, xlarge);
* orientation (portrait, landscape);
* brightness (dark, light);
* platform (web, android, ios, fuchsia, macOS, linux, windows)
* languageCode;
* countryCode;
* shortestSide; (for example may be use for detect tablet. Just set >=700)