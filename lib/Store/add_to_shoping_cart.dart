import 'package:flutter/material.dart';
class AddToCart with ChangeNotifier{
  int badge = 0;
  void badgeIncrementer(){
    badge++;
    notifyListeners();
  }
  void initialValue(){
    badge = 0;
    notifyListeners();
  }
}