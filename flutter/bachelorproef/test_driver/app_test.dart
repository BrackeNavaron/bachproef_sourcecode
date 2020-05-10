import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('All Tests', () {
    FlutterDriver driver;

    final plusButton = find.byValueKey("plusButton");
    final title = find.byValueKey("title");

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("some test", () async {
      await driver.tap(plusButton);
      expect(await driver.getText(title), "twee");
    });
  });
}