
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/future_provider/ui/future_provider_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Future Provider Page Testing ", (){

    // Testing Success Case
    testWidgets('Test Success Case', (WidgetTester tester) async{
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: FutureProviderPage()
          )
        )
      );

      expect(find.text('Future Provider Example'), findsOneWidget);

      await tester.tap(find.byKey(const Key('fetchData')));
      await tester.pump();

      expect(find.text('Showing Data from Cache.'), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));    

      expect(find.text('Fetched Data Successfully'), findsOneWidget);
    }); 

    testWidgets('Test Error Case', (WidgetTester tester) async{
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: FutureProviderPage()
          )
        )
      );

      expect(find.text('Future Provider Example'), findsOneWidget);

      await tester.tap(find.byKey(const Key('fetchErrorData')));
      await tester.pump();

      expect(find.text('Showing Data from Cache.'), findsOneWidget);
      // The error message is shown after 1 second
      await tester.pump(const Duration(seconds: 2)); 

      expect(find.text('Error: Exception: Error fetching data'), findsOneWidget);
    });

  });
}