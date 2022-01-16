import 'package:flutter/material.dart';
import 'package:gagarian_mobile/Model/item_model.dart';
import 'package:http/http.dart';

class FetchItem with ChangeNotifier {

  List<Result> items = [];

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<void>  fetchItems(val) async {
    String url = 'https://gagarianrest.herokuapp.com/$val/';
    try{
      final response = await get(Uri.parse(url));
      print(url);

      if (response.statusCode == 200) {
        final res = itemFromJson(response.body);
        print(response.body);
        items.addAll(res.results);
        notifyListeners();
      }
    }catch(e){
      print("hello $e");
    }
    notifyListeners();
  }

  void initialValues() {
    items = [];
    _errorMessage = '';
    notifyListeners();
  }
}
