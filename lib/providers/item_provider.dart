import 'dart:collection';

import 'package:flutter/foundation.dart';
import '../model/item.dart';

class ItemProvider extends ChangeNotifier {

  List<Item> _items = [];

  int _count = 0;
  int get count => _count;

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void addItem(Item item){
    _items.add(item);
    notifyListeners();
  }

  void deleteItemByIndex(int index){
    _items.removeAt(index);
    notifyListeners();
  }

  void deleteItem(Item item){
    _items.remove(item);
    notifyListeners();
  }

  void toggle(int index){
    final value = _items[index].toggleChecked();
    if(value){
      plus();
    }else{
      minus();
    }
    notifyListeners();
  }


  void plus(){
    _count++;
  }

  void minus(){
    _count--;
  }




}