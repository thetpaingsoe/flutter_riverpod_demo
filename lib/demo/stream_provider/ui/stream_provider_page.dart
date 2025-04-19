import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/stream_provider/provider/clock_provider.dart';

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});  

  String _formatTime(DateTime? time) {
    if (time == null) {
      return "Loading...";
    }
    return "${time.hour.toString().padLeft(2, '0')}:"
          "${time.minute.toString().padLeft(2, '0')}:"
          "${time.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Stream Provider Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 24,
            ),
            Text('Stream Provider Example : ${_formatTime(ref.watch(clockProvider).value)}'),
          ],
        ),
      ),
    );
  }
}