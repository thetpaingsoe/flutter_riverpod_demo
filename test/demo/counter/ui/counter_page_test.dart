import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/counter/ui/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CounterPage Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: CounterPage(),
        ),
      )
    );

    // Verify the initial state
    expect(find.text("Count: 0"), findsOneWidget);
    expect(find.text("Count: 1"), findsNothing);

    // Increase the counter
    await tester.tap(find.byWidgetPredicate((widget) =>
      widget is FloatingActionButton &&
      widget.heroTag == 'increment'));
    await tester.pumpAndSettle(); // Wait for animations to finish

    // Verify the counter increased
    expect(find.text("Count: 1"), findsOneWidget);
    expect(find.text("Count: 0"), findsNothing);

    // Decrease the counter
    await tester.tap(find.byKey(const Key('decrement-button')));
    await tester.pumpAndSettle(); // Wait for animations to finish

    // Verify the counter decreased
    expect(find.text("Count: 0"), findsOneWidget);
    expect(find.text("Count: 1"), findsNothing);
  });
}