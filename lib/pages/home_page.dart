import 'package:flutter/material.dart';
import 'package:my_applecation/providers/item_provider.dart';
import 'package:provider/provider.dart';

import '../model/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(label: Text("Enter your task")),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  String text = textEditingController.text;
                  final item = Item(title: text);
                  final provider = Provider.of<ItemProvider>(context, listen: false);
                  provider.addItem(item);
                  textEditingController.clear();
                },
                child: const Text("Add"),
            ),
            const SizedBox(
              height: 20,
            ),
            ListViewBuild(),
          ],
        ),
      ),
    );
  }
}


class ListViewBuild extends StatelessWidget {
  const ListViewBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<ItemProvider>(
        builder: (context, value, child) {
          final items = value.items;
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: value.items.length,
            itemBuilder: (context, index) => GestureDetector(
              onLongPress: (){
                value.deleteItem(index);
              },
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.grey.shade400,
                    child: Text(items[index].title[0],)
                ),
                title: Text(items[index].title, style: items[index].checked ? TextStyle(decoration: TextDecoration.lineThrough) : null),
                trailing: Checkbox(
                  value: items[index].checked,
                  onChanged: (_){
                    value.toggle(index);
                  },
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
