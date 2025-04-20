import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataList extends ChangeNotifier {
  String data = "";
  bool isLoading = false;
  String errorData = "";

  Future<String> fetchData() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    data = "Fetched Data Successfully";
    errorData = "";
    isLoading = false;
    notifyListeners();
    return data;
  }

  Future<String> fetchErrorData() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    data = "";
    errorData = "Error Fetching Data";
    isLoading = false;
    notifyListeners();
    return errorData;
  }
}

final dataListProvider = ChangeNotifierProvider<DataList>((ref) {
  return DataList();
});