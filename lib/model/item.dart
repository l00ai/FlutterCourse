class Item {
  final String title;
  bool checked;

  Item({required this.title, this.checked = false});

  bool toggleChecked(){
    checked = !checked;
    return checked;
  }

}