class Item {
  final String title;
  bool checked;

  Item({required this.title, this.checked = false});

  toggleChecked(){
    checked = !checked;
  }

}