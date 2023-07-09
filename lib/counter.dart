import 'package:flutter/material.dart';

class Counter extends InheritedWidget {
  int count;
  Widget child;

  Counter({Key? key, required this.child, required this.count}) : super(child: child, key: key);

  static Counter of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Counter>()!;
  }

  @override
  bool updateShouldNotify(Counter oldWidget) {
    return count != oldWidget.count;
  }




}