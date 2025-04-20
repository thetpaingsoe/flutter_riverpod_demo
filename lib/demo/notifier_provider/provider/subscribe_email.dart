import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubscribeEmail extends Notifier<AsyncValue<bool>>{
  @override
  AsyncValue<bool> build() {
    return const AsyncValue.data(false);
  }

  Future<void> subscribe(String email) async {
    state = const AsyncValue.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      // check email format
      _subscribeEmail(email);
      state = AsyncValue.data(true);
    }catch(e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void _subscribeEmail(String email) {
    // Simulate email subscription logic
   if(email.isEmpty) {
      throw Exception('Email cannot be empty');
    }else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
      throw Exception('Invalid email format');
    }
  }
}

final subscribeEmailProvider = NotifierProvider<SubscribeEmail, AsyncValue<bool>> ( () => SubscribeEmail());
