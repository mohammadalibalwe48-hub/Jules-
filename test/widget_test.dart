// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  // To avoid actual Supabase initialization errors during widget tests,
  // we initialize with mock data or simply don't trigger the real main() logic directly.
  setUpAll(() async {
    // This is optional if we don't strictly call main() and just pump MyApp.
    // However, if MyApp itself initialized Supabase (we moved it to main),
    // then pumping MyApp directly works fine since it assumes Supabase is already initialized.
    // If the test still crashes because Supabase.instance isn't ready in the state,
    // we could use a mock or simply comment out the Supabase fetching.
    // Since we access Supabase.instance.client in _StatTrackerHomeState,
    // we need an instance initialized before the widget pumps.
    await Supabase.initialize(
      url: 'https://mock.supabase.co',
      anonKey: 'mock',
    );
  });

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
