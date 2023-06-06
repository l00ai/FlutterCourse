import 'package:flutter/material.dart';


void main(){

  runApp(
      MaterialApp(
       debugShowCheckedModeBanner: false,
       home: MyApp(),
      )
  );
}




// ListView
// 1- ListView
// 2- ListView.Builder
// 2- ListView.separated





// GridView
// 1- GridView          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
// 2- GridView.builder  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
// 3- GridView.count
// 4- GridView.extent //double width = MediaQuery.of(context).size.width;





class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<String> empNameList = [
    "Ahmed",
    "Ali",
    "Omar",
    "Sami",
    "Esam",
    "Mohammed",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: empNameList.length,
        itemBuilder: (context, index) => ListItem(name: empNameList[index]),
      ),
    );
  }
}


class ListItem extends StatelessWidget {
  final String name;
  const ListItem({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: 100,
      width: 100,
      margin: const EdgeInsets.only(),
      child: Text(name),
    );
  }
}






