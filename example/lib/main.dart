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
        StringResources()
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
  Map<String, Resource<String>> get resources => {
    display: Resource('default', [
      ResourceOption('l',
        displayMetrics: DisplayMetrics.l
      ),
      ResourceOption('m',
        displayMetrics: DisplayMetrics.m
      ),
      ResourceOption('h',
        displayMetrics: DisplayMetrics.h
      ),
      ResourceOption('xh',
        displayMetrics: DisplayMetrics.xh
      ),
      ResourceOption('xxh',
        displayMetrics: DisplayMetrics.xxh
      ),
      ResourceOption('xxxh',
        displayMetrics: DisplayMetrics.xxxh
      )
    ]),
    screen: Resource('default', [
      ResourceOption('small',
        screenSize: ScreenSize.small
      ),
      ResourceOption('normal',
        screenSize: ScreenSize.normal
      ),
      ResourceOption('large',
        screenSize: ScreenSize.large
      ),
      ResourceOption('xlarge',
        screenSize: ScreenSize.xlarge
      )
    ]),
    orientation: Resource('default', [
      ResourceOption('portrait',
        orientation: Orientation.portrait
      ),
      ResourceOption('landscape',
        orientation: Orientation.landscape
      )
    ]),
    language: Resource('other', [
      ResourceOption('en',
        languageCode: 'en'
      ),
    ]),
    country: Resource('other', [
      ResourceOption('us',
        countryCode: 'US'
      ),
    ]),
    platform: Resource('other', [
      ResourceOption('web',
        platform: PlatformType.web
      ),
      ResourceOption('android',
        platform: PlatformType.android
      ),
      ResourceOption('ios',
        platform: PlatformType.ios
      ),
      ResourceOption('fuchsia',
        platform: PlatformType.fuchsia
      ),
      ResourceOption('linux',
        platform: PlatformType.linux
      ),
      ResourceOption('macOS',
        platform: PlatformType.macOS
      ),
      ResourceOption('windows',
        platform: PlatformType.windows
      ),
    ])
  };

}