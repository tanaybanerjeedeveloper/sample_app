import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final homeProvider = ChangeNotifierProvider.autoDispose<HomeProvider>((ref) {
  return HomeProvider();
});

class HomeProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List _data = [];
  List get data => _data;

  getData() async {
    try {
      _isLoading = true;
      notifyListeners();
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      _data = json.decode(response.body);
      print('response: $_data');
    } catch (error) {
      print('error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
