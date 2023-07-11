import 'package:flutter/material.dart';


class TimerProvider extends ChangeNotifier {

  int _count = 100;

  int get count => _count;

  void decrementCount(){
    _count--;
    notifyListeners();
  }

}