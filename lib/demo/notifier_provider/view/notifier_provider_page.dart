import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/notifier_provider/provider/subscribe_email.dart';

class NotifierProviderPage extends ConsumerWidget {
  const NotifierProviderPage({super.key});

  static TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscribeStatus = ref.watch(subscribeEmailProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Notifier Provider Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 24),
            Text('Notifier Provider Example'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                key: const Key("email-textfield"),
                controller: textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Email',
                ),
              ),
            ),
            const SizedBox(height: 16),
            subscribeStatus.when(
              data: (data) => data ? Text("Subscribed.") : const SizedBox(),
              loading: () => const Text('Loading...'),
              error:
                  (error, stack) => Text(
                    'Error: $error',
                    style: const TextStyle(color: Colors.red),
                  ),
            ),
            const SizedBox(height: 8),
            subscribeStatus.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  key: const Key("subscribe"),
                  onPressed: () {
                    ref
                        .read(subscribeEmailProvider.notifier)
                        .subscribe(textEditingController.text);
                    textEditingController.clear();
                  },
                  child: const Text('Subscribe'),
                ),
          ],
        ),
      ),
    );
  }
}
