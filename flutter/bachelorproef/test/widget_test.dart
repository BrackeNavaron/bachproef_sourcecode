import 'package:bachelorproef/main.dart';
import 'package:flutter_test/flutter_test.dart';
import  'package:flutter/material.dart';

void main() {
  testWidgets('Sample UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    //Tap item 2
    await tester.tap(find.byIcon(Icons.add).at(1));
    //Do a redraw
    await tester.pumpAndSettle();
    //Verify that the title changed
    expect(find.text("two"), findsOneWidget);
  });
}
