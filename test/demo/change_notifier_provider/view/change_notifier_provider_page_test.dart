
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/change_notifier_provider/view/change_notifier_provider_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("ChangeNotifierProviderPage Test : Fetch Success ", (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ChangeNotifierProviderPage()
        )
      )
    );

    expect(find.text('Change Notifier Provider Example'), findsOneWidget);

    await tester.tap(find.byKey(const Key('fetch-success')));

    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.text('Fetched Data Successfully'), findsOneWidget);
    
  });

  testWidgets("ChangeNotifierProviderPage Test : Fetch Failed", (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
         home : ChangeNotifierProviderPage() 
        )
      )
    );

    await tester.tap(find.byKey(const Key('fetch-error')));

    await tester.pump();

    // It should show loading
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();
    // it should show error message
    expect(find.text('Error Fetching Data'), findsOneWidget);
    
  });
}