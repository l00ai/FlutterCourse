import 'package:flutter/material.dart';

void main(){

  // FloatingActionButton(
  //   child: Icon(Icons.add),
  //   elevation: 0,
  //   backgroundColor: Colors.indigo,
  //   tooltip: "ADD",
  //   onPressed: (){
  //     print("FAB");
  //   },
  // )

  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {

  int count = 0;

  @override
  Widget build(BuildContext context) {



     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.green,
         title: const Text("Welcome..."),
         centerTitle: true,
         leading: Icon(Icons.arrow_back),
         actions: [
           IconButton(
             onPressed: (){},
             icon: Icon(Icons.ac_unit),
           ),
           IconButton(
             onPressed: (){},
             icon: Icon(Icons.ac_unit),
           )
         ],
       ),
       // floatingActionButton: GestureDetector(
       //   onTap: ()=> print("FAB Clicked !"),
       //   child: Container(
       //     height: 70,
       //     width: 70,
       //     decoration: BoxDecoration(
       //       color: Colors.indigo,
       //       borderRadius: BorderRadius.circular(35)
       //     ),
       //     child: Icon(Icons.add, color: Colors.white, size: 32),
       //   ),
       // ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Container(),
           Row(
             children: [
               Expanded(
                 child: Padding(
                   padding: EdgeInsets.all(10),
                   child: Container(
                     height: 100,
                     color: Colors.green,
                   ),
                 ),
               ),
               Expanded(
                 child: Container(
                   height: 100,
                   color: Colors.amber,
                 ),
               ),
             ],
           ),
           Row(
             children: [
               Container(
                 height: 100,
                 width: 200,
                 color: Colors.purpleAccent,
               ),
               Container(
                 height: 100,
                 width: 200,
                 color: Colors.lime,
               ),
             ],
           ),
           // SizedBox(height: 10,),
           Text(count.toString()),
           MyCustomButton(
               label: "Hi",
               onClicked: (){
                 count++;
                 print(count);
               }),
           // IconButton(
           //   onPressed: (){},
           //   icon: Icon(Icons.ac_unit),
           // )
         ],
       ),
     );
  }

}


typedef MyFunc = void Function()?;

class MyCustomButton extends StatelessWidget {
  final String label;
  final MyFunc? onClicked;
  const MyCustomButton({Key? key, required this.label, this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Ink(
        width: 100,
        height: 50,
        color: Colors.indigoAccent,
        child: Center(child: Text(label, style: TextStyle(color: Colors.white, fontSize: 18) ,)),
      ),
    );
  }
}














typedef M = void Function(int pages);



class Book {
  String name;
  String author;

  M read;

  Book(this.name, this.author, this.read);
}








