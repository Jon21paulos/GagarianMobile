import 'dart:io';

import 'package:gagarian_mobile/Model/user_model.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FetchUser with ChangeNotifier {

  List<UsersData> users = [];
  bool _notify = false;
  String _errorMessage = '';
  String url = 'https://gagarianrest.herokuapp.com/rest-auth/user/';
  bool _message = true;
  String value = "key";

  String? token;

  SharedPreferences? _prefs;

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  loadFromPrefs() async {
    await _initPrefs();
    token = _prefs!.getString(value) ?? "";
    print(token);
    fetchUser(token);
    notifyListeners();
  }

  bool get message => _message;

  bool get notify => _notify;

  String get errorMessage => _errorMessage;

  Future<void>  fetchUser(key) async {
    try{
      final response = await get(Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'token $key',
        },
      );
      if (response.statusCode == 200) {
        final result = usersDataFromJson(response.body);
        users.add(result);
        _notify = true;
        print("succesfull");
        notifyListeners();
      }
      if (response.statusCode == 401) {
        _notify = false;
        print("un authorized");
      }

    }catch(e){
      _notify = false;
      print('error occured');
    }

    notifyListeners();
  }

  void initialValues() {
    users = [];
    _notify = false;
    _message = true;
    _errorMessage = '';
    notifyListeners();
  }
}
