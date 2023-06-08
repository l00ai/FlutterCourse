import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void main(){

  runApp(
      MaterialApp(
       debugShowCheckedModeBanner: false,
       home: MyApp(name: "Title"),
      )
  );
}




// ListView
// 1- ListView
// 2- ListView.Builder
// 2- ListView.separated





// GridView
// #1- GridView          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
// #2- GridView.builder  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

// 3- GridView.count
// 4- GridView.extent //double width = MediaQuery.of(context).size.width;






class MyApp extends StatefulWidget {
  final String name;
  const MyApp({super.key, required this.name});

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pink,
                Colors.pink.shade900
              ],
            )
          ),
        ),
      ),
      drawer: Drawer(),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: const [
          ListItem(),
          ListItem(),
          ListItem(),
          ListItem(),
        ],
      )
    );
  }
}


class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Header 1"),
          const SizedBox(height: 10,),
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                mainAxisExtent: height * 0.25
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: const [
              GridItem(),
              GridItem(),
              GridItem(),
              GridItem(),
            ],
          ),
        ],
      ),
    );
  }
}



class GridItem extends StatelessWidget {
  const GridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.pinkAccent
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Expanded(
            child: Center(child: Icon(Icons.ac_unit, color: Colors.white,)),
          ),
          Container(
            height: 35,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10))
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            child: const Text(
              "Title",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}







