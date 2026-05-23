// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  testWidgets('Stat Tracker app test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify initial values.
    expect(find.text('Water'), findsOneWidget);
    expect(find.text('0 Glasses'), findsOneWidget);
    expect(find.text('Pushups'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Reading'), findsOneWidget);
    expect(find.text('0 Pages'), findsOneWidget);

    // Tap the water add button
    await tester.tap(find.widgetWithIcon(IconButton, Icons.add_circle).first);
    await tester.pump();

    // Verify water updated
    expect(find.text('1 Glasses'), findsOneWidget);
  });
}
