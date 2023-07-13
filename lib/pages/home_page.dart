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

  onAddButtonPressed() {
    String text = textEditingController.text;
    if(text.isEmpty){
      return;
    }
    final item = Item(title: text);
    final provider = Provider.of<ItemProvider>(context, listen: false);
    provider.addItem(item);
    textEditingController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(label: Text("Enter your task")),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: onAddButtonPressed,
                child: const Text("Add"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TVCount(),
          ListViewBuild(),

        ],
      ),
    );
  }
}


class TVCount extends StatelessWidget {
  const TVCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ItemProvider, int>(
      selector: (_, itemProvider) => itemProvider.count,
      builder: (context, value, child) {
        print("Selector 1");
        return Center(
          child: Text("Done Tasks: $value"),
        );
      },
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
          print("Consumer 1");
          final items = value.items;
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: items.length,
            itemBuilder: (context, index) => GestureDetector(
              onLongPress: (){
                value.deleteItemByIndex(index);
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
