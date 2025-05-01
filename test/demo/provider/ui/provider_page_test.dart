import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/provider/ui/provider_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Provider Page Testing ", (){
    testWidgets('Test Provider Page', (WidgetTester tester) async{
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: ProviderPage()
          ),
        )
      );

      expect(find.text('Loaded : Config ~ v1.0.0'), findsOneWidget);
    });
  });
}