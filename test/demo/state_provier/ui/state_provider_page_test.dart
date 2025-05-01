
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/state_provider/ui/state_provider_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("State Provider Page Testing", () {
    testWidgets('Testing Light and Dar Mode Switch', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home : StateProviderPage()
          )
        )
      );

      expect(find.text('State Provider Example : ThemeMode.light Mode'), findsOneWidget); 

      // Switch to dark mode
      await tester.tap(find.byKey(const Key('switch')));
      await tester.pumpAndSettle();
      expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.dark);

      // Switch back to light mode
      await tester.tap(find.byKey(const Key('switch')));
      await tester.pumpAndSettle();
      expect(Theme.of(tester.element(find.byType(Scaffold))).brightness, Brightness.light);
    });

    
  });
}