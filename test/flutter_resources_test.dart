import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_resources/flutter_resources.dart';

void main() {
  test('empty', () {
  });
}

class IntResources extends ResourceDelegate<int> {
  
  @override
  Map<String, Resource<int>> get resources => {
    'one': Resource(15, [
      ResourceOption(5,
        screenSize: ScreenSize.normal,
        displayMetrics: DisplayMetrics.h,
      )
    ])
  };

}