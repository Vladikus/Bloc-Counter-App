import 'package:flutter/material.dart';
import 'package:bloc_counter/app.dart';
import 'package:bloc_counter/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('CounterApp', () {
    testWidgets('is_MaterialApp', (tester) async {
      expect(CounterApp(), isA<MaterialApp>());
    });
    

    testWidgets('Home is CounterPage', (tester) async {
      expect(CounterApp().home, isA<CounterPage>());
    });

    testWidgets('CounterPage rendered', (tester) async {
      await tester.pumpWidget(CounterApp());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}