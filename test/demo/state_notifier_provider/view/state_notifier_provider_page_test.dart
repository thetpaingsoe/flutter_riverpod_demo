
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/state_notifier_provider/view/state_notifier_provider_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Testing State Notifier Provider Page', () {

    testWidgets('Testing Add Todo', (WidgetTester tester) async{
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: StateNotifierProviderPage()
          )
        )
      );

      await tester.enterText(find.byKey(const Key('todo-text-field')), 'Todo 1');

      await tester.tap(find.byKey(const Key('add-todo-button')));
      await tester.pumpAndSettle();

      expect(find.text('Todo 1'), findsOneWidget);
    });

    testWidgets('Testing Complete Todo', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home : StateNotifierProviderPage()
          )
        )
      );

      await tester.enterText(find.byKey(const Key('todo-text-field')), 'Todo 1');

      await tester.tap(find.byKey(const Key('add-todo-button')));
      await tester.pumpAndSettle();

      // Check
      await tester.tap(find.byKey(const Key('todo-checkbox-Todo 1')));
      await tester.pumpAndSettle();

      expect(find.text('Todo 1'), findsOneWidget);

      final textFinder = find.text('Todo 1');
      final textWidget = tester.firstWidget<Text>(textFinder);
      expect(textWidget.style?.decoration, TextDecoration.lineThrough);

      // Uncheck
      await tester.tap(find.byKey(const Key('todo-checkbox-Todo 1')));
      await tester.pumpAndSettle();

      final textFinder2 = find.text('Todo 1');
      final textWidget2 = tester.firstWidget<Text>(textFinder2);
      expect(textWidget2.style?.decoration, TextDecoration.none);
      
    });
  });
}