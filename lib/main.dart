import 'package:flutter/material.dart';


void main(){
  runApp(
      MaterialApp(
       debugShowCheckedModeBanner: false,
       home: MyApp(name: "Title"),
      )
  );
}


class MyApp extends StatefulWidget {
  final String name;
  MyApp({super.key, required this.name});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {


  late TabController controller;

  tabListener() {
    print(controller.index);
  }

  @override
  void initState() {
   controller = TabController(length: 3, vsync: this);
   controller.addListener(tabListener);
    super.initState();
  }


  @override
  void dispose() {
    controller.removeListener(tabListener);
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
        actions: [
          TextButton(
              onPressed: (){
                //controller.animateTo(2);
              },
              child: const Text("Next", style: TextStyle(color: Colors.white),)
          )
        ],
        bottom: TabBar(
          controller: controller,
          tabs: const [
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Search",
              icon: Icon(Icons.search),
            ),
            Tab(
              text: "Profile",
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
      body: TabBarView(
        //physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Container(
            color: Colors.purpleAccent,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.indigoAccent,
          ),
        ],
      )
    );
  }
}









// class MyApp extends StatefulWidget {
//   final String name;
//   MyApp({super.key, required this.name});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
//
//   late TabController tabController;
//
//   @override
//   void initState() {
//     tabController = TabController(length: 3, vsync: this);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("TabBar & TabBar View"),
//           bottom: TabBar(
//             controller: tabController,
//             tabs: const [
//               Tab(
//                 text: 'Gift',
//                 icon: Icon(
//                   Icons.card_giftcard,
//                 ),
//                 iconMargin: EdgeInsets.only(bottom: 10.0),
//               ),
//               Tab(
//                 text: 'Ac',
//                 icon: Icon(
//                   Icons.ac_unit_rounded,
//                 ),
//                 iconMargin: EdgeInsets.only(bottom: 10.0),
//               ),
//               Tab(
//                 text: 'Adb',
//                 icon: Icon(
//                   Icons.adb,
//                 ),
//                 iconMargin: EdgeInsets.only(bottom: 10.0),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           controller: tabController,
//           children: [
//             Container(color: Colors.pink,),
//             Container(color: Colors.purpleAccent,),
//             Container(color: Colors.blueAccent,),
//           ],
//         )
//     );
//   }
// }


// class MyApp extends StatelessWidget {
//   final String name;
//   MyApp({super.key, required this.name});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Text"),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 text: 'Gift',
//                 icon: Icon(
//                   Icons.card_giftcard,
//                 ),
//                 iconMargin: EdgeInsets.only(bottom: 10.0),
//               ),
//               Tab(
//                 text: 'Ac',
//                 icon: Icon(
//                   Icons.ac_unit_rounded,
//                 ),
//                 iconMargin: EdgeInsets.only(bottom: 10.0),
//               ),
//               Tab(
//                 text: 'Adb',
//                 icon: Icon(
//                   Icons.adb,
//                 ),
//                 iconMargin: EdgeInsets.only(bottom: 10.0),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             Container(color: Colors.pink,),
//             Container(color: Colors.purpleAccent,),
//             Container(color: Colors.blueAccent,),
//           ],
//         )
//       ),
//     );
//   }
// }
//
//








