
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/change_notifier_provider/provider/data_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DataListProvider Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state should be data: ""', () {
      final dataList = container.read(dataListProvider);
      expect(dataList.data, "");
      expect(dataList.isLoading, false);
      expect(dataList.errorData, "");
    });

    test('fetchData should update data and isLoading', () async {
      final dataListNotifier = container.read(dataListProvider.notifier);
      final futureData = dataListNotifier.fetchData();
      expect(dataListNotifier.isLoading, true);

      await futureData;
      expect(dataListNotifier.isLoading, false);
      expect(dataListNotifier.data, "Fetched Data Successfully");
      expect(dataListNotifier.errorData, "");
    });

    test('fetchErrorData should update errorData and isLoading', () async {
      final dataListNotifier = container.read(dataListProvider.notifier);
      final futureData = dataListNotifier.fetchErrorData();
      expect(dataListNotifier.isLoading, true);

      await futureData;
      expect(dataListNotifier.isLoading, false);
      expect(dataListNotifier.data, "");
      expect(dataListNotifier.errorData, "Error Fetching Data");
    });
  });
}