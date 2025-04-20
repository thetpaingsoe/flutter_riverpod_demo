import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/change_notifier_provider/provider/data_list.dart';

class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataList = ref.watch(dataListProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Change Notifier Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text('Change Notifier Provider Example'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => ref.read(dataListProvider.notifier).fetchData(),
              child: const Text('Fetch Data : Success'),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed:
                  () => ref.read(dataListProvider.notifier).fetchErrorData(),
              child: const Text('Fetch Data : Error'),
            ),
            const SizedBox(height: 16),
            dataList.isLoading
                ? const CircularProgressIndicator()
                : dataList.data != ""
                ? Text(dataList.data, style: const TextStyle(color: Colors.green))
                : Text(dataList.errorData, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
