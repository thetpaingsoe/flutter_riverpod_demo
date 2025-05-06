
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/stream_provider/provider/clock_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group("Stream Provider Test", () {

    test('Testing Stream Provider', () async {
      
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final emitted = <DateTime>[];

      // Listen to state changes
      // Add add to emitted list when the stream emits a value
      void listener(AsyncValue<DateTime>? prev, AsyncValue<DateTime> next) {
        if (next.hasValue) {
          emitted.add(next.value!);
        }
      }

      final removeListener = container.listen<AsyncValue<DateTime>>(
        clockProvider,
        listener,
        fireImmediately: true,
      );

      // Wait 3 seconds to allow for a few ticks
      await Future.delayed(const Duration(seconds: 3));
      removeListener.close();

      // Since we wait 3 seconds, it should receive at least 2 ticks
      expect(emitted.length, greaterThanOrEqualTo(2), reason: 'Should emit at least 2 ticks');
      expect(emitted[0], isA<DateTime>());
      expect(emitted[1].isAfter(emitted[0]), isTrue);
    
    });

  });
}