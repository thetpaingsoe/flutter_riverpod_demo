import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/future_provider/provider/data_list.dart';
import 'package:flutter_riverpod_demo/demo/future_provider/repository/data_repository.dart';

class FutureProviderPage extends ConsumerWidget {
  FutureProviderPage({super.key});
  final repo = DataRepository();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    
    final dataList = ref.watch(dataListProvider(repo: repo));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Future Provider Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 24,
            ),
            Text('Future Provider Example'),
            const SizedBox(
              height: 24,
            ),
            FilledButton(
              key: const Key('fetchData'),
              onPressed: () {
              ref.read(dataListProvider(repo: repo).notifier).fetchData();
            }, child: Text('Fetch Data : Success')),
            const SizedBox(
              height: 24,
            ),
            FilledButton(
              key: const Key('fetchErrorData'),
              onPressed: () {
              ref.read(dataListProvider(repo: repo).notifier).fetchErrorData();
            }, child: Text('Fetch Data : Error')),
            const SizedBox(
              height: 24,
            ),
            dataList.when(
              data: (data) => Text(data),
              loading: () => Text('Loading...'),
              error: (error, stack) => Text('Error: $error'),
            )
          ],
        ),
      ),
    );
  }
}