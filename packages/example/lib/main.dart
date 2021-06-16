import 'package:flutter/material.dart';
import 'package:flutter_resources/flutter_resources.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Resources(
      delegates: [
        StringResources(),
        StringAndroidResources(),
        StringIOSResources()
      ],
      child: MaterialApp(
        title: 'Flutter resources',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {

    final resources = Resources.of(context);
    final display = resources.get<String>(StringResources.display);
    final screen = resources.get<String>(StringResources.screen);
    final orientation = resources.get<String>(StringResources.orientation);
    final language = resources.get<String>(StringResources.language);
    final country = resources.get<String>(StringResources.country);
    final platform = resources.get<String>(StringResources.platform);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter resources'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Display: $display',
            ),
            Text(
              'Screen: $screen',
            ),
            Text(
              'Orientation: $orientation',
            ),
            Text(
              'Language: $language',
            ),
            Text(
              'Country: $country',
            ),
            Text(
              'Platform: $platform',
            ),
          ],
        ),
      ),
    );
  }
}

class StringResources extends ResourceDelegate<String> {

  static const display = 'display';
  static const screen = 'screen';
  static const orientation = 'orientation';
  static const language = 'language';
  static const country = 'country';
  static const platform = 'platform';

  @override
  ResourceOption? get options => null;
  
  @override
  Map<String, String> get values => {
    display: 'display defaults',
    screen: 'screen defaults',
    orientation: 'screen defaults',
    language: 'language defaults',
    country: 'country defaults',
    platform: 'Platform defaults'
  };

}


class StringAndroidResources extends ResourceDelegate<String> {

  static const display = 'display';
  static const screen = 'screen';
  static const orientation = 'orientation';
  static const language = 'language';
  static const country = 'country';
  static const platform = 'platform';

  @override
  ResourceOption? get options => ResourceOption(
    platform: PlatformType.android
  );

  @override
  Map<String, String> get values => {
    platform: 'Platform android'
  };

}

class StringIOSResources extends ResourceDelegate<String> {

  static const display = 'display';
  static const screen = 'screen';
  static const orientation = 'orientation';
  static const language = 'language';
  static const country = 'country';
  static const platform = 'platform';

  @override
  ResourceOption? get options => ResourceOption(
    platform: PlatformType.ios
  );

  @override
  Map<String, String> get values => {
    platform: 'Platform ios'
  };

}