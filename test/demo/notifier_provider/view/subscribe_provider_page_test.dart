import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/notifier_provider/view/notifier_provider_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("NotifierProviderTest", () {
    testWidgets("Testing Subscribe Email : Error State : Invalid Format", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: NotifierProviderPage())),
      );

      expect(find.text("Notifier Provider Example"), findsOneWidget);
      // Input the data and subscribe
      await tester.enterText(find.byKey(const Key("email-textfield")), "abc");
      await tester.tap(find.byKey(const Key('subscribe')));
      await tester.pump();

      // Checking the loading 
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(CircularProgressIndicator), findsNothing);
      await tester.pumpAndSettle();

      // Checking the error message.
      expect(
        find.text("Error: Exception: Invalid email format"),
        findsOneWidget,
      );
    });

    testWidgets("Testing Subscribe Email : Error State : Empty Email", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: NotifierProviderPage())),
      );

      // Input without filling email
      await tester.tap(find.byKey(const Key('subscribe')));
      await tester.pump();

      // Checking the loading
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(CircularProgressIndicator), findsNothing);
      await tester.pumpAndSettle();

      // Checking the error message
      expect(
        find.text("Error: Exception: Email cannot be empty"),
        findsOneWidget,
      );
    });

    testWidgets("Testing Subscribe Email : Loading State", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: NotifierProviderPage())),
      );

      // Input the email and subscribe
      await tester.enterText(
        find.byKey(const Key("email-textfield")),
        "test@example.com",
      );
      await tester.tap(find.byKey(const Key('subscribe')));
      await tester.pump(); 

      // Verify loading state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets("Testing Subscribe Email : Sccuess", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: NotifierProviderPage())),
      );

      // Input the email and subscribe
      await tester.enterText(
        find.byKey(const Key("email-textfield")),
        "test@example.com",
      );
      await tester.tap(find.byKey(const Key('subscribe')));
      await tester.pump();

      // Verify loading state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(CircularProgressIndicator), findsNothing);

      // Check the success message.
      await tester.pumpAndSettle();
      expect(find.text("Subscribed."), findsOneWidget);
    });
  });
}
