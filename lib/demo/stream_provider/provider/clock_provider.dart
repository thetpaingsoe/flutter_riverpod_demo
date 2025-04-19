import 'package:flutter_riverpod/flutter_riverpod.dart';

// *Note* : You must use "autoDispose" to dispose the stream 
// when the widget is removed from the tree. 
final clockProvider = StreamProvider.autoDispose<DateTime>((ref) async* {
  ref.onDispose(() {
      // ignore: avoid_print
      print('⛔️ Clock Stream Disposed');
    });
  while (true) {
    
    // ignore: avoid_print
    print("⏰ Clock Stream Tick");
    await Future.delayed(const Duration(seconds: 1));
    yield DateTime.now();
  } 
});