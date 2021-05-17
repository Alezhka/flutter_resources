# flutter_resources

Flutter resources managment plugin.

## Getting Started

1. Import library.
```
import 'package:flutter_resources/flutter_resources.dart';
```

2. Create resource delegates. For example:
```
class IntResources extends ResourceDelegate<int> {
  
  @override
  Map<String, Resource<int>> get resources => {
    'name': Resource(15, [
      ResourceOption(5,
        screenSize: ScreenSize.normal,
        displayMetrics: DisplayMetrics.h,
      )
    ]),
    'custom': Resource(10, [
      ResourceOption(2,
        displayMetrics: DisplayMetrics.xh,
        screenSize: ScreenSize.normal,
        orientation: Orientation.landscape,
        languageCode: 'en',
        countryCode: 'US',
        platform: PlatformType.Android,
      )
    ])
  };

}
``` 

If no one options not conditions will be returned default value.

3. Put Resources widget before App widget.
```
Resources( 
    delegates: [
        IntResources(),
        ... // Some resource delegates.
    ],
    child: MaterialApp(), 
)
```

4. Get data.
```
final resources = Resources.of(context);
final custom = resources.get<int>('custom');

```

## Support options

* displayMetrics (l, m, h, xh, xxh, xxxh);
* screenSize (small, normal, large, xlarge);
* orientation (portrait, landscape);
* brightness (dark, light);
* platform (web, android, ios, fuchsia, macOS, linux, windows)
* languageCode;
* countryCode;