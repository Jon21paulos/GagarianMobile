import 'package:flutter/material.dart';
import 'package:gagarian_mobile/Model/token_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AuthenticationService with ChangeNotifier{

  String _errorMessage = "";
  List<TokenData> token = [];
  bool _isLoading = false;
  String value = "key";
  SharedPreferences? _prefs;

  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  void setIsLoading(val){
    _isLoading = val;
    notifyListeners();
  }

  void setErrorMessage(e){
    _errorMessage = e;
    notifyListeners();
  }
  _saveToPrefs(k) async {
    await _initPrefs();
    _prefs!.setString(value, k);
    notifyListeners();
  }
  _removeFromPrefs()async{
    await _initPrefs();
    _prefs!.remove(value);
    notifyListeners();
  }
  Future signOut(context) async{
    await _removeFromPrefs();
    Navigator.pushReplacementNamed(context, 'signin');
  }
  Future signIn(
      {context, required String usernameController, required String passwordController}) async {
    try{
      setIsLoading(true);
      var response =await http.post(
          Uri.parse("https://gagarianrest.herokuapp.com/rest-auth/login/"),
          body: {
            "username":usernameController,
            "password":passwordController,
          }
        );
         final token = tokenDataFromJson(response.body);
        _saveToPrefs(token.key);
        Navigator.pushReplacementNamed(context, 'home');
        print(token.key);
        setIsLoading(false);
      }catch(e){
        print(e);
      }
  }

  Future signUp(
      {context,required String usernameController, required String passwordController}) async {
     try{
       setIsLoading(true);
       var response =await http.post(
           Uri.parse("https://gagarianrest.herokuapp.com/rest-auth/registration/"),
           body: {
             "username":usernameController,
             "password1":passwordController,
             "password2":"1234abcd"
           }
          );
       Navigator.pushReplacementNamed(context, 'signin');
       setIsLoading(false);
       print(response.body);
     }catch(e){
       print(e);
     }
  }
  void initialValues(){
    setErrorMessage("");
    setIsLoading(false);
  }
}

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}