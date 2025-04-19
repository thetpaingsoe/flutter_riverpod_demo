class DataRepository {
  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    return 'Fetched Data Successfully';
  }
  Future<String> fetchError() async {
    await Future.delayed(const Duration(seconds: 1));
    throw Exception('Error fetching data');
  }
}