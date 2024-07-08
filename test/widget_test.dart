// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculator/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  await tester.pumpWidget(MyApp());

  // Find the widget with text "0" and font size 48.0
expect(find.byWidgetPredicate((widget) => 
  widget is Text && 
  widget.data == '0' && 
  widget.style?.fontSize == 48.0), findsOneWidget);

  // Perform the action that increments the counter
await tester.pumpAndSettle();
debugDumpApp();
await tester.pumpAndSettle();
await tester.tap(find.byKey(Key('add_button')));
await tester.pumpAndSettle();  // Animasyonlar veya durum değişikliklerinin işlenmesini sağlamak için
  expect(find.text('1'), findsOneWidget);
});
}
