import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/demo/future_provider/provider/data_list.dart';
import 'package:flutter_riverpod_demo/demo/future_provider/repository/data_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<DataRepository>()])
import 'data_list_test.mocks.dart';

void main() {


  group('DataListTest', (){
    late ProviderContainer container;
    late MockDataRepository mockDataRepository;
    
    setUp((){
      
      mockDataRepository = MockDataRepository();
      container = ProviderContainer();
    });

    tearDown((){
      container.dispose();
    });
    
    test('Initial state should be empty string', () async {
      final dataList = await container.read(dataListProvider(repo: mockDataRepository).future);
      expect(dataList, '');      
    });
    
    test('fetchData should return fetched data', () async {
        // Prepare the mock responses
        when(mockDataRepository.fetchCacheData()).thenReturn('Showing Data from Cache.');
        when(mockDataRepository.fetchData()).thenAnswer((_) async => 'Fetched Data Successfully');
        
        // Read the provider notifier
        final provider = container.read(dataListProvider(repo: mockDataRepository).notifier);

        // Call the fetchData method
        final returnData = provider.fetchData();

        // Test initial state (cached data)
        expect(provider.state.value, 'Showing Data from Cache.');

        // Wait for the async operation to complete
        final result = await returnData;
        expect(result, 'Fetched Data Successfully');

        // // Verify final state after the async operation completes (fetched data)
        expect(provider.state.value, 'Fetched Data Successfully');
  
    });

    test('fetchErrorData should return error data',() async {
      // Prepare the mock responses
      when(mockDataRepository.fetchCacheData()).thenReturn('Showing Data from Cache.');
      when(mockDataRepository.fetchError()).thenAnswer((_) async {
        await Future.delayed(const Duration(seconds: 1));
        throw Exception('Error Fetching Data');
      });

      // Read the provider notifier
      final provider = container.read(dataListProvider(repo: mockDataRepository).notifier);

      // Call the fetchErrorData method
      final returnData = provider.fetchErrorData();

      // Get Data from Cache
      expect(provider.state.value, 'Showing Data from Cache.');

      // Wait for the async operation to complete
      try {
        final result = await returnData;
        expect(result, 'Exception: Error Fetching Data');
      } catch (e) {
        expect(e.toString(), 'Exception: Error Fetching Data');
      }

    });


  });
}