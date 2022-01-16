import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gagarian_mobile/Model/catagories_model.dart';
import 'package:http/http.dart';

class FetchCatagories with ChangeNotifier {

  List<Catagories> catagories = [];

  String _errorMessage = '';
  String url = 'https://gagarianrest.herokuapp.com/categories/';

  String get errorMessage => _errorMessage;

  Future<void> get fetchCatagories async {
    try{
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        final result = catagoriesFromJson(response.body);
        catagories.addAll(result);
        notifyListeners();
      }
    }catch(e){
      print('error occured');
    }
    notifyListeners();
  }

  void initialValues() {
    catagories = [];
    _errorMessage = '';
    notifyListeners();
  }
}
