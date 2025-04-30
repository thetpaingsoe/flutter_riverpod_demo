
import 'package:flutter_riverpod_demo/demo/future_provider/repository/data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_list.g.dart';

@riverpod
class DataList extends _$DataList {

  @override
  Future<String> build({required DataRepository repo}) async{
    return Future.value('');
  }

  Future<String> fetchData() async {

    // This is the sample of 
    // returning data from cache
    // before fetching data from server
    state = AsyncValue.data(repo.fetchCacheData());
    try {
      
      final data = await repo.fetchData();
      state = AsyncValue.data(data);
      return data;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<String> fetchErrorData() async {
   state = AsyncValue.data(repo.fetchCacheData());
    try {
      final data = await repo.fetchError();
      state = AsyncValue.data(data);
      return data;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

}