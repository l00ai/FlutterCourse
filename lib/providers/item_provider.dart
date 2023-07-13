import 'dart:collection';

import 'package:flutter/foundation.dart';
import '../model/item.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void addItem(Item item){
    _items.add(item);
    notifyListeners();
  }

  void deleteItem(int index){
    _items.removeAt(index);
    notifyListeners();
  }

  void toggle(int index){
    _items[index].toggleChecked();
    notifyListeners();
  }



}