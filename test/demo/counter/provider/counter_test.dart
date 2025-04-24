
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod_demo/demo/counter/provider/counter.dart';


void main() {
  group('Counter Provider Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state should be 0', () {
      final counter = container.read(counterProvider);
      expect(counter, 0);
    });

    test('Increment should increase state by 1', () {
      final counterNotifier = container.read(counterProvider.notifier);
      counterNotifier.increment();
      final counter = container.read(counterProvider);
      expect(counter, 1);
    });

    test('Decrement should decrease state by 1', () {
      final counterNotifier = container.read(counterProvider.notifier);
      counterNotifier.decrement();
      final counter = container.read(counterProvider);
      expect(counter, -1);
    });

    test('Increment and Decrement should work together', () {
      final counterNotifier = container.read(counterProvider.notifier);
      counterNotifier.increment();
      counterNotifier.increment();
      counterNotifier.decrement();
      final counter = container.read(counterProvider);
      expect(counter, 1);
    });
  });
}