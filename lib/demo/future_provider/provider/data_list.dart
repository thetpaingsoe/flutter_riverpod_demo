
import 'package:flutter_riverpod_demo/demo/future_provider/repository/data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_list.g.dart';

@riverpod
class DataList extends _$DataList {
  @override
  Future<String> build() {
    // i want to retur a blnak string
    return Future.value('');
  }

  Future<String> fetchData() async {
   state = const AsyncValue.loading();
    try {
      final repo = DataRepository();
      final data = await repo.fetchData();
      state = AsyncValue.data(data);
      return data;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<String> fetchErrorData() async {
   state = const AsyncValue.loading();
    try {
      final repo = DataRepository();
      final data = await repo.fetchError();
      state = AsyncValue.data(data);
      return data;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

}